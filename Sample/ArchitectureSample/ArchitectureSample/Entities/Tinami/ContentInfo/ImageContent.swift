//
//  ImageContent.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 画像形式のコンテンツ
struct ImageContent {
    /// 画像コンテンツのURL
    let imageUrl: URL
    /// 画像コンテンツの高さ
    let height: Int
    /// 画像コンテンツの幅
    let width: Int

    init(imageUrl: URL,
        height: Int,
        width: Int) {
        self.imageUrl = imageUrl
        self.height = height
        self.width = width
    }
}
