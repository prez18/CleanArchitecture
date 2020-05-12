//
//  AuthKeyDatabase.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol AuthKeyDatabase {
    func save(_ authKey: AuthKey, complition: @escaping (Result<(), Error>) -> ())
    func read(complition: @escaping (Result<AuthKey?, Error>) -> ())
}
