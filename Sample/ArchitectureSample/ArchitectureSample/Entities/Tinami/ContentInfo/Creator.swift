//
//  Creator.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// クリエイター情報
struct Creator {
    /// creatorId
    let id: String
    /// クリエイター名
    let name: String
    /// クリエイター画像
    let thumbnail: URL
    /// ブックマークしているか
    let isbookmark: Bool

    init(id: String,
        name: String,
        thumbnail: URL,
        isbookmark: Bool) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.isbookmark = isbookmark
    }
}
