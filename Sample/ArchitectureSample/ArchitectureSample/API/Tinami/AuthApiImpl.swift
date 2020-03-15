//
//  AuthApi.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation
import RxSwift

/// 認証API
final class AuthApiImpl: AuthApi {
    
    private let network: Network
    private let recoveryRule: RecoveryRule
    private let responseValidation: ResponseValidation
    
    private var disposeBag = DisposeBag()
    
    init(network: Network,
         recoveryRule: RecoveryRule,
         responseValidation: ResponseValidation) {
        self.network = network
        self.recoveryRule = recoveryRule
        self.responseValidation = responseValidation
    }
    
    func request(userId: UserId, password: Password, completion: @escaping (Result<AuthKey, AuthApiError>) -> ()) {
        self.network.send(for: TinamiApi.auth(format: .json, userId: userId, password: password)).retryWhen(self.recoveryRule.rule).do(onNext: { response in
            try self.responseValidation.validate(for: response.data)
        }).flatMap { response in
            AuthTranslator().translate(response.data)
        }.subscribe(onNext: { authKey in
            completion(.success(authKey))
        }, onError: { error in
            completion(.failure(AuthApiError(message: error.localizedDescription)))
        }).disposed(by: self.disposeBag)
    }
    
    func cancel() {
        self.disposeBag = DisposeBag()
    }
}

struct AuthApiError: Error {
    let message: String
}


fileprivate struct AuthTranslator {
    func translate(_ data: Data) -> Observable<AuthKey> {
        guard let jsonObject: Any = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
            let jsonDictionay = jsonObject as? NSDictionary,
            let authKey = jsonDictionay["auth_key"] as? String else {
            assert(false, "作品取得Apiで予期しない値が返却されている")
            return Observable.empty()
        }
        return Observable.just(AuthKey(value: authKey))
    }
}
