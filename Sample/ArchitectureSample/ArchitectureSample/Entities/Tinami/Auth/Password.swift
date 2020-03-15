//
//  Password.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// パスワード
struct Password {
    let value: String
    
    init(value: String) throws {
        guard value.count > 0 else {
            throw PasswordEmptyError()
        }
        self.value = value
    }
}

/// パスワードが空
struct PasswordEmptyError: Error {
    
}
