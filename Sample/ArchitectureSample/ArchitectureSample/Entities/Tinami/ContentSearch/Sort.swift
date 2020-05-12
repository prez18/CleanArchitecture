//
//  Sort.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 検索ソート順
///
/// - new: 新着順
/// - score: 支援スコアの高い順
/// - value: 支援数の多い順
/// - view: 閲覧数の多い順
/// - rand: ランダム
enum Sort {
    case new
    case score
    case value
    case view
    case rand
}
