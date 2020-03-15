//
//  Thumbnail.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// サムネイル
struct Thumbnail: Equatable {
    /// 幅
    public let width: Int
    /// 高さ
    public let height: Int
    /// url
    public let url: URL

    /// initializer
    ///
    /// - Parameters:
    ///   - wight: 幅
    ///   - height: 高さ
    ///   - url: url
    init(width: Int, height: Int, url: URL) {
        self.width = width
        self.height = height
        self.url = url
    }
}
