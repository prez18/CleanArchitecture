//
//  ContentSearchApi.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol ContentSearchApi {
    func search(for conf: ContentSearchConfigration,
                authKey: AuthKey?,
                complition: @escaping (Result<ContentSearchResult, Error>) -> ())
}
