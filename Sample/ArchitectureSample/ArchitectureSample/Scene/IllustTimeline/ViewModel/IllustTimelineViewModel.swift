//
//  IllustTimelineViewModel.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// イラストタイムラインモデル
struct IllustTimelineViewModel {
    let illustDescriptionViewModels: [IllustDescriptionViewModel]
}

struct IllustDescriptionViewModel {
    /// タイトル
    let title: String
    /// サムネイル
    let thumbnail: URL
}
