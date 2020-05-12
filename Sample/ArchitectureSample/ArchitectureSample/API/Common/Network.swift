//
//  Network.swift
//  DefaultNetwork
//
//  Created by prez on 2019/01/01.
//  Copyright © 2019 prez. All rights reserved.
//

import Foundation
import RxSwift

/// ネットワーク
protocol Network {
    /// リクエストを送信する
    ///
    /// - Parameter request: リクエスト
    /// - Returns: レスポンス
    func send(for request: Request) -> Observable<Response>
}

/// パラメータ
typealias HttpParameter = [String: Any?]

/// クエリアイテム
struct QueryItem {
    /// キー
    let key: String
    /// 値
    let value: String

    /// initializer
    ///
    /// - Parameters:
    ///   - key: キー
    ///   - value: 値
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

/// ヘッダー
typealias HttpHeader = [String: String]

/// HTTPメソッド
///
/// - get: get
/// - post: post
enum HttpMethod: String {
    case get
    case post
}

/// リクエスト
protocol Request {
    /// scheme
    var scheme: String { get }
    /// host
    var host: String { get }
    /// path
    var path: String { get }
    /// header
    var header: HttpHeader { get }
    /// method
    var method: HttpMethod { get }
    /// parameter
    var parameter: [QueryItem] { get }
    /// timeoutInterval
    var timeoutInterval: Double { get }
}

/// レスポンス
struct Response {
    /// data
    let data: Data
    /// mimeType
    let mimeType: String?
    /// textEncodingName
    let textEncodingName: String?
    /// url
    let url: URL?

    /// initializer
    ///
    /// - Parameters:
    ///   - data: data
    ///   - mimeType: mimeType
    ///   - textEncodingName: textEncodingName
    ///   - url: url
    init(data: Data, mimeType: String?, textEncodingName: String?, url: URL?) {
        self.data = data
        self.mimeType = mimeType
        self.textEncodingName = textEncodingName
        self.url = url
    }
}

/// 復旧ルール
protocol RecoveryRule {
    /// 復旧ルールを実行する
    ///
    /// NOTE: - 例えば以下の目的にこのプロトコルを準拠して利用する
    ///       - 特定のエラーの場合，3回までリトライ
    ///       - 特定回数リトライする(かつ一定時間待機する)
    ///       - トークンエラーの場合，再認証APIを実行し，成功してからリトライする
    /// 参考: https://qiita.com/kuroruri/items/328c6d25abae71641d5d
    var rule: (_ error: Observable<Error>) -> Observable<()> { get }
}

/// レスポンスに対するValidation
protocol ResponseValidation {
    /// レスポンスをValidateする処理
    ///
    /// - Parameter data: ValidateしたいData
    /// - Returns: Validateした結果問題ない場合に発火
    func validate(for data: Data) throws
}

/// 復旧は何もせずにエラーとする復旧ルール
struct NoRecoveryRule: RecoveryRule {

    init() {
    }

    var rule: (_ error: Observable<Error>) -> Observable<()> {
        return { error in
            error.flatMap { error in
                Observable.error(error)
            }
        }
    }
}
