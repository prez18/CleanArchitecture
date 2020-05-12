//
//  AuthKeyDatabaseImpl.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation
import RealmSwift

final class AuthKeyDatabaseImpl: AuthKeyDatabase {

    func save(_ authKey: AuthKey, complition: @escaping (Result<(), Error>) -> ()) {
        let realmObject = AuthKeyRealmObject()
        realmObject.value = authKey.value
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
        complition(.success(()))
    }
    
    func read(complition: @escaping (Result<AuthKey?, Error>) -> ()) {
        // 永続化された値を取得する処理
    }
    
}

final class AuthKeyRealmObject: Object {
   
    @objc dynamic var value: String = ""

}
