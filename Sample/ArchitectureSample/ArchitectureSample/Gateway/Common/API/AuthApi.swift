//
//  AuthApi.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol AuthApi {
    func request(userId: UserId, password: Password, completion: @escaping (Result<AuthKey, AuthApiError>) -> ())
}
