//
//  ContentSearchApiImpl.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation
import RxSwift

/// 作品検索API
final class ContentSearchApiImpl: ContentSearchApi {
    
    /// Network
    private let network: Network
    /// 復旧ルール
    private let recoveryRule: RecoveryRule
    /// ResponseValidation
    private let responseValidation: ResponseValidation

    private var disposeBag = DisposeBag()
    
    /// initializer
    ///
    /// - Parameters:
    ///   - network: network
    ///   - recoveryRule: 復旧ルール
    init(network: Network, recoveryRule: RecoveryRule, responseValidation: ResponseValidation) {
        self.network = network
        self.recoveryRule = recoveryRule
        self.responseValidation = responseValidation
    }
    
    func search(for conf: ContentSearchConfigration,
                authKey: AuthKey?,
                complition: @escaping (Result<ContentSearchResult, Error>) -> ()) {
        
        self.network.send(for: TinamiApi.search(format: .json, parameter: conf, authKey: authKey)).map { response in
            try self.responseValidation.validate(for: response.data)
            return try ContentSearchTranslator().translate(response.data)
        }.retryWhen(self.recoveryRule.rule).subscribe(onNext: { authKey in
            complition(.success(authKey))
        }, onError: { error in
            complition(.failure(ContentSearchError(message: error.localizedDescription)))
        }).disposed(by: self.disposeBag)
    }
}

struct ContentSearchError: Error {
    let message: String
}

/// 作品検索を変換する
fileprivate struct ContentSearchTranslator {
    /// 作品検索を変換する
    ///
    /// - Parameter data: Apiからのレスポンス
    /// - Returns: ドメインに最適化された作品検索結果
    /// - Throws: パースエラー
    func translate(_ data: Data) throws -> ContentSearchResult {
        if let jsonObject: Any = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
            let jsonDictionay: NSDictionary = jsonObject as? NSDictionary,
            let perpage: Int = jsonDictionay["perpage"] as? Int,
            let page: Int = jsonDictionay["page"] as? Int,
            let pages: Int = jsonDictionay["pages"] as? Int,
            let total: Int = jsonDictionay["total"] as? Int,
            let contentsArray: NSArray = jsonDictionay["contents"] as? NSArray {
            let contents: [ContentDescription] = contentsArray.map { content -> ContentDescription in
                if let contentsDescription: ContentDescription = ContentDescriptionTranslater.translate(content) {
                    return contentsDescription
                } else {
                    assert(false, "作品検索Apiで予期しない値が返却されている")
                    return ContentDescription(id: ContentId(value: ""), type: .illust, title: "", viewLevel: .public, ageLevel: .everyone, thumbnail: Thumbnail(width: 0, height: 0, url: URL(string: "http://google.com")!))
                }
            }

            return ContentSearchResult(
                perpage: perpage,
                page: page,
                pages: pages,
                total: total,
                contents: contents
            )
        } else {
            assert(false, "作品検索Apiで予期しない値が返却されている")
            return ContentSearchResult(
                perpage: 0,
                page: 0,
                pages: 0,
                total: 0,
                contents: []
            )
        }
    }
}

/// 作品概要のトランスレータ
fileprivate struct ContentDescriptionTranslater {
    /// 作品概要をドメインに最適な形式に変換する
    ///
    /// - Parameter input: Apiに最適な形の作品概要
    /// - Returns: ドメインに最適な形式の作品概要
    static func translate(_ input: Any) -> ContentDescription? {
        guard let contentDictionary: NSDictionary = input as? NSDictionary else {
            return nil
        }
        guard let content: NSDictionary = contentDictionary["content"] as? NSDictionary else {
            return nil
        }
        guard let idInt: Int = content["id"] as? Int else {
            return nil
        }
        guard let contentType: ContentType = ContentTypeTranslater.translate(content) else {
            return nil
        }
        guard let title: String = content["title"] as? String else {
            return nil
        }
        guard let viewLevel: ViewLevel = ViewLevelTranslater.translate(content) else {
            return nil
        }
        guard let ageLevel: AgeLevel = AgeLevelTranslater.translate(content) else {
            return nil
        }
        guard let thumbnail: Thumbnail = ThumbnailTranslater.translate(content) else {
            return nil
        }
        let id: String = String(idInt)
        return ContentDescription(
            id: ContentId(value: id),
            type: contentType,
            title: title,
            viewLevel: viewLevel,
            ageLevel: ageLevel,
            thumbnail: thumbnail
        )
    }
}

/// 作品の種類のトランスレータ
fileprivate struct ContentTypeTranslater {
    /// コンテンツの種類をドメインに最適な形式に変換する
    ///
    /// - Parameter input: Apiに最適な形の作品の種類
    /// - Returns: ドメインに最適な形式の作品の種類
    static func translate(_ input: NSDictionary) -> ContentType? {
        guard let input: String = input["type"] as? String else {
            return nil
        }
        switch input {
        case "illust":
            return .illust

        case "manga":
            return .manga

        case "cosplay":
            return .cosplay

        case "novel":
            return .novel

        case "model":
            return .model

        default:
            return nil
        }
    }
}

/// 公開レベルのトランスレータ
fileprivate struct ViewLevelTranslater {
    /// 公開レベルをドメインに最適な形式に変換する
    ///
    /// - Parameter input: Apiに最適な形の公開レベル
    /// - Returns: ドメインに最適な形式の公開レベル
    static func translate(_ input: NSDictionary) -> ViewLevel? {
        guard let input: String = input["view_level"] as? String else {
            return nil
        }
        switch input {
        case "public":
            return .public

        case "user":
            return .user

        case "supporter":
            return .supporter

        default:
            return nil
        }
    }
}

/// 年齢制限のトランスレータ
fileprivate struct AgeLevelTranslater {
    /// 年齢制限をドメインに最適な形式に変換する
    ///
    /// - Parameter input: Apiに最適な形の年齢制限
    /// - Returns: ドメインに最適な形式の年齢制限
    static func translate(_ input: NSDictionary) -> AgeLevel? {
        guard let ageLevel: Int = input["age_level"] as? Int else {
            return nil
        }
        switch ageLevel {
        case 1:
            return .everyone

        case 2:
            return .everyoneButSemiNude

        case 3:
            return .r15

        default:
            return nil
        }
    }
}

/// サムネイルトランスレータ
fileprivate struct ThumbnailTranslater {
    /// ドメインに最適な形式のサムネイルに変換する
    ///
    /// - Parameter input: Apiに最適な形のサムネイル
    /// - Returns: ドメインに最適な形式のサムネイル
    static func translate(_ input: NSDictionary) -> Thumbnail? {
        guard let input: NSDictionary = input["thumbnails"] as? NSDictionary,
            let thumbnail: NSDictionary = input["thumbnail_150x150"] as? NSDictionary,
            let urlStr: String = thumbnail["url"] as? String,
            let url: URL = URL(string: urlStr),
            let width: Int = thumbnail["width"] as? Int,
            let height: Int = thumbnail["height"] as? Int else {
            return nil
        }
        return Thumbnail(
            width: width,
            height: height,
            url: url
        )
    }
}
