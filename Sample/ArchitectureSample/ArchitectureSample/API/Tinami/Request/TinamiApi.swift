//
//  TinamiApi.swift
//  RemoteDataStore
//
//  Created by prez on 2019/01/03.
//  Copyright © 2019 prez. All rights reserved.
//

import Foundation

/// TinamiApiキー
public var tinamiApiKey: String = TinamiApiKey().value

/// フォーマット
///
/// - xml: xml
/// - json: json
public enum Format: String {
    case xml
    case json
}

enum TinamiApi: Request {
    case auth(format: Format, userId: UserId, password: Password)
    case search(format: Format, parameter: ContentSearchConfigration, authKey: AuthKey?)
}

fileprivate let basisErrorMessage: String = "エラーが発生しました．しばらく経ってからお試しください．"
