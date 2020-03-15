//
//  AuthGateway.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol AuthGateway {
    func authenticate(userId: UserId, password: Password, completion: @escaping (Result<Void, Error>) -> ())
    func deauthorize(completion: @escaping (Result<Void, Error>) -> ())
}
