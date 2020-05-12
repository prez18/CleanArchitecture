//
//  ContentSearchGatewayImpl.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/08.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class ContentSearchGatewayImpl: ContentSearchGateway {
            
    let contentSearchApi: ContentSearchApi
    let authKeyDatabase: AuthKeyDatabase
    
    init(contentSearchApi: ContentSearchApi,
         authKeyDatabase: AuthKeyDatabase) {
        self.contentSearchApi = contentSearchApi
        self.authKeyDatabase = authKeyDatabase
    }
    
    func search(for conf: ContentSearchConfigration,
                complition: @escaping (Result<ContentSearchResult, Error>) -> ()) {
        if conf.isSafe {
            self.contentSearchApi.search(for: conf, authKey: nil, complition: complition)
        } else {
            self.authKeyDatabase.read { result in
                switch result {
                case .success(let authkey):
                    guard let authkey = authkey else {
                        complition(.failure(NoAuthKeyError()))
                        return
                    }
                    self.contentSearchApi.search(for: conf, authKey: authkey, complition: complition)
                case .failure(let error):
                    complition(.failure(error))
                }
            }
        }
    }
    
    func cancel() {
        // キャンセル処理
    }
}
