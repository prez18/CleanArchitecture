//
//  ContentInfoApi.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol ContentInfoApi {
    func fetch(parameter: ContentInfoParameter, complition: @escaping (Result<ContentInfo, Error>) -> ())
}
