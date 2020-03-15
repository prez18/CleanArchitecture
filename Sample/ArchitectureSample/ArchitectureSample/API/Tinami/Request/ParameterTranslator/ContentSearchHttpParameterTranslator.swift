//
//  ContentSearchHttpParameterTranslator.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

struct ContentSearchHttpParameterTranslator {
    func translate(_ format: Format, _ parameter: ContentSearchConfigration, _ authKey: AuthKey?) -> [QueryItem] {
        var httpParameter: [QueryItem] = []
        httpParameter.append(QueryItem(key: "api_key", value: tinamiApiKey))
        if let authKey: String = authKey?.value {
            httpParameter.append(QueryItem(key: "auth_key", value: authKey))
        }
        if !parameter.text.isEmpty {
            httpParameter.append(QueryItem(key: "text", value: parameter.text.map { $0.trimmingCharacters(in: .whitespaces) }.joined(separator: " ")))
        }
        if !parameter.tags.isEmpty {
            httpParameter.append(QueryItem(key: "tags", value: parameter.tags.map { $0.trimmingCharacters(in: .whitespaces) }.joined(separator: " ")))
        }
        httpParameter.append(QueryItem(key: "search", value: SearchTranslater().translate(parameter.search)))
        httpParameter.append(QueryItem(key: "sort", value: SortTranslater().translate(parameter.sort)))
        parameter.contType.forEach { contType in
            httpParameter.append(QueryItem(key: "cont_type[]", value: ContTypeTranslater().translate(contType)))
        }
        httpParameter.append(QueryItem(key: "page", value: String(parameter.page)))
        httpParameter.append(QueryItem(key: "perpage", value: String(parameter.perpage)))
        if let profId: String = parameter.profId {
            httpParameter.append(QueryItem(key: "prof_id", value: profId))
        }
        httpParameter.append(QueryItem(key: "safe", value: String(parameter.isSafe ? 1 : 0)))
        httpParameter.append(QueryItem(key: "format", value: format.rawValue))
        return httpParameter
    }
}

/// 検索条件のトランスレータ
struct SearchTranslater {
    ///  検索条件をAPIのパラメータ用に変換する
    ///
    /// - Parameter input: ドメインに最適化されたパラメータ
    /// - Returns: Apiに最適化されたパラメータ
    func translate(_ input: SearchCondition) -> String {
        switch input {
        case .and:
            return "and"
        case .or:
            return "or"
        }
    }
}

/// 作品検索のソート順のトランスレータ
struct SortTranslater {
    /// 作品検索のソート順をAPIのパラメータ用に変換する
    ///
    /// - Parameter input: ドメインに最適化されたパラメータ
    /// - Returns: Apiに最適化されたパラメータ
    func translate(_ input: Sort) -> String {
        switch input {
        case .new:
            return "new"
        case .score:
            return "score"
        case .value:
            return "value"
        case .view:
            return "view"
        case .rand:
            return "rand"
        }
    }
}

/// 検索対象にするコンテンツの種類のトランスレータ
struct ContTypeTranslater {
    /// 検索対象にするコンテンツの種類をAPIのパラメータ用に変換する
    ///
    /// - Parameter input: ドメインに最適化されたパラメータ
    /// - Returns: Apiに最適化されたパラメータ
    func translate(_ input: ContentType) -> String {
        switch input {
        case .illust:
            return "1"
        case .manga:
            return "2"
        case .model:
            return "3"
        case .novel:
            return "4"
        case .cosplay:
            return "5"
        }
    }
}
