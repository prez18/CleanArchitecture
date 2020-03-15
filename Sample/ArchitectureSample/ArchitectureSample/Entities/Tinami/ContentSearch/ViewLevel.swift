//
//  ViewLevel.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 公開レベル
///
/// - public: 誰でも見れる
/// - user: ユーザー登録している人なら誰でも見れる
/// - supporter: あなたをお気に入りに登録しているユーザーのみ見れる
enum ViewLevel {
    case `public`
    case user
    case supporter
}
