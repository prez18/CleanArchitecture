//
//  TinamiApi+Path.swift
//  RemoteDataStore
//
//  Created by prez on 2019/01/03.
//  Copyright © 2019 prez. All rights reserved.
//

import Foundation

extension TinamiApi {
    /// Path
    var path: String {
        switch self {
        case .auth:
            return "/api/auth"
        case .search:
            return "/api/content/search"
        }
    }
}
