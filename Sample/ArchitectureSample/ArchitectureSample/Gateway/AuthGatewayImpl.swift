//
//  AuthGatewayImpl.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class AuthGatewayImpl: AuthGateway {
    
    let authApi: AuthApi
    let authKeyDatabase: AuthKeyDatabase
    
    init(authApi: AuthApi, authKeyDatabase: AuthKeyDatabase) {
        self.authApi = authApi
        self.authKeyDatabase = authKeyDatabase
    }
    
    func authenticate(userId: UserId, password: Password, completion: @escaping (Result<Void, Error>) -> ()) {
        self.authApi.request(userId: userId, password: password) { result in
            switch result {
            case .success(let authKey):
                self.authKeyDatabase.save(authKey) { result in
                    switch result {
                    case .success:
                        completion(.success(()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deauthorize(completion: @escaping (Result<Void, Error>) -> ()) {
        // 認証を解除する
    }
}
