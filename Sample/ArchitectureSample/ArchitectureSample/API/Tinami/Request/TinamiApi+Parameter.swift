//
//  TinamiApi+Parameter.swift
//  RemoteDataStore
//
//  Created by prez on 2019/01/03.
//  Copyright © 2019 prez. All rights reserved.
//

import Foundation

extension TinamiApi {
    // parameter
    var parameter: [QueryItem] {
        switch self {
        case let .auth(format, userId, password):
            let httpParameter: [QueryItem] = AuthHttpParameterTranslator().translate(format, userId: userId, password: password)
            return httpParameter
        case let .search(format, parameter, authKey):
            let httpParameter: [QueryItem] = ContentSearchHttpParameterTranslator().translate(format, parameter, authKey)
            return httpParameter
        }
    }
}
