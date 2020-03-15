//
//  ContentInfoGatewayImpl.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class ContentInfoGatewayImpl: ContentInfoGateway {
    
    let contentInfoApi: ContentInfoApi
    let contentInfoDatabase: ContentInfoDatabase
    
    init(contentInfoApi: ContentInfoApi,
         contentInfoDatabase: ContentInfoDatabase) {
        self.contentInfoApi = contentInfoApi
        self.contentInfoDatabase = contentInfoDatabase
    }
    
    func read(parameter: ContentInfoParameter, complition: @escaping (Result<ContentInfo, Error>) -> ()) {
        self.read(parameter: parameter, useCash: true, complition: complition)
    }
    
    func read(parameter: ContentInfoParameter, useCash: Bool, complition: @escaping (Result<ContentInfo, Error>) -> ()) {
        if useCash {
            self.contentInfoDatabase.read { result in
                switch result {
                case .success(let contentInfo):
                    if let contentInfo = contentInfo {
                        // isGetDatesやisGetMultipleModelsの条件に一致しているかもチェック
                        complition(.success(contentInfo))
                    } else {
                        self.contentInfoApi.fetch(parameter: parameter) { result in
                            switch result {
                            case .success(let contentInfo):
                                self.contentInfoDatabase.save(contentInfo) { result in
                                    switch result {
                                    case .success:
                                        complition(.success(contentInfo))
                                    case .failure(let error):
                                        complition(.failure(error))
                                    }
                                }
                            case .failure(let error):
                                complition(.failure(error))
                            }
                        }
                    }
                case .failure(let error):
                    complition(.failure(error))
                }
            }
        } else {
            self.contentInfoApi.fetch(parameter: parameter) { result in
                switch result {
                case .success(let contentInfo):
                    self.contentInfoDatabase.save(contentInfo) { result in
                        switch result {
                        case .success:
                            complition(.success(contentInfo))
                        case .failure(let error):
                            complition(.failure(error))
                        }
                    }
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
