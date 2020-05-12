//
//  TinamiApi+Method.swift
//  RemoteDataStore
//
//  Created by prez on 2019/01/03.
//  Copyright © 2019 prez. All rights reserved.
//

import Foundation

extension TinamiApi {
    /// HttpMethod
    var method: HttpMethod {
        switch self {
        case .auth:
            return .post
        case .search:
            return .get
        }
    }
}
