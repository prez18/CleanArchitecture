//
//  ContentInfoDatabase.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol ContentInfoDatabase {
    func save(_ contentInfo: ContentInfo, complition: @escaping (Result<(), Error>) -> ())
    func read(complition: @escaping (Result<ContentInfo?, Error>) -> ())
}
