//
//  ContentSearchGateway.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 作品検索
protocol ContentSearchGateway {
    func search(for conf: ContentSearchConfigration,
    complition: @escaping (Result<ContentSearchResult, Error>) -> ())
    func cancel()
}
