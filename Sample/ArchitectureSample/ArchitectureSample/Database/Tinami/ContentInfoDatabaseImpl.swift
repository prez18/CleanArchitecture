//
//  ContentInfoDatabaseImpl.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation
import RealmSwift

final class ContentInfoDatabaseImpl: ContentInfoDatabase {
    
    func save(_ contentInfo: ContentInfo, complition: @escaping (Result<(), Error>) -> ()) {
        // 永続化処理
    }
    
    // IDを渡す
    func read(complition: @escaping (Result<ContentInfo?, Error>) -> ()) {
        // 永続化された値を取得する
    }
}
