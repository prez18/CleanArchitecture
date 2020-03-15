//
//  UserId.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// ユーザID
struct UserId {
    let value: String
    
    init(value: String) throws {
        guard value.count > 0 else {
            throw UserIdEmptyError()
        }
        self.value = value
    }
}

/// ユーザIDが空
struct UserIdEmptyError: Error {
    
}
