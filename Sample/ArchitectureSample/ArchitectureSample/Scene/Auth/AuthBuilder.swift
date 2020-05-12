//
//  AuthBuilder.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class AuthBuilder {
    func build() -> AuthViewController {
        let vc = AuthViewController()
        let authApi = AuthApiImpl(network: DefaultNetwork(),
                              recoveryRule: NoRecoveryRule(),
                              responseValidation: TinamiApiDefaultValidation())
        let authKeyDatabase = AuthKeyDatabaseImpl()
        let authGateway = AuthGatewayImpl(authApi: authApi,
                                          authKeyDatabase: authKeyDatabase)
        let presenter = AuthPresenter(output: vc)
        let interactor = AuthInteractor(output: presenter,
                                         authGateway: authGateway)
        vc.inject(interactor: interactor)
        return vc
    }
}
