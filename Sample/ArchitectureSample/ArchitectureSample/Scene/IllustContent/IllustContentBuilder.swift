//
//  IllustContentBuilder.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class IllustContentBuilder {
    func build(contentDescription: ContentDescription) -> IllustContentViewController {
        let vc = IllustContentViewController()
        let presenter = IllustContentPresenter(output: vc)
        let contentInfoApi = ContentInfoApiImpl()
        let contentInfoDatabase = ContentInfoDatabaseImpl()
        let contentInfoGateway = ContentInfoGatewayImpl(contentInfoApi: contentInfoApi,
                                                        contentInfoDatabase: contentInfoDatabase)
        let interactor = IllustContentInteractor(output: presenter,
                                                 contentDescription: contentDescription, contentInfoGateway: contentInfoGateway)
        vc.inject(interactor: interactor)
        return vc
    }
}
