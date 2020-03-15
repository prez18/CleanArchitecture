//
//  ContentInfoApiImpl.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation
import RxSwift

/// 作品情報API
final class ContentInfoApiImpl: ContentInfoApi {
    
    func fetch(parameter: ContentInfoParameter, complition: @escaping (Result<ContentInfo, Error>) -> ()) {
        // 作品情報APIを実行する
    }
    
}
