//
//  SearchCondition.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 検索条件
///
/// - and: すべての語を含む
/// - or: いずれかの語を含む
enum SearchCondition {
    case and
    case or
}
