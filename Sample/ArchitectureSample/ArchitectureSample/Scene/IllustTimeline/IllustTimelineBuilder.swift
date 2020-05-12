//
//  IllustTimelineBuilder.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class IllustTimelineBuilder {
    
    func build() -> IllustTimelineViewController {
        let vc = IllustTimelineViewController()
        let presenter = IllustTimelinePresenter(output: vc)
        let contentSearchApi = ContentSearchApiImpl(
            network: DefaultNetwork.shared,
            recoveryRule: NoRecoveryRule(),
            responseValidation: TinamiApiDefaultValidation())
        let authKeyDatabase = AuthKeyDatabaseImpl()
        let contentSearchGateway = ContentSearchGatewayImpl(contentSearchApi: contentSearchApi,
                                                            authKeyDatabase: authKeyDatabase)
        let interactor = IllustTimelineInteractor(output: presenter,
                                                  contentSearchGateway: contentSearchGateway)
        vc.inject(interactor: interactor)
        return vc
    }
    
}
