//
//  AgeLevel.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 作品に設定された年齢制限
///
/// - everyone: [制限なし] 人物のヌードやセミヌードを含まない作品
/// - everyoneButSemiNude: [制限なし] 人物のセミヌード、水着や下着姿などを含む作品。表示では「1」との区別はありません。
/// - r15: [15歳未満禁止] 人物のヌードを含んだ作品。この場合のヌードとは、ポートレイトのレベルで、性器の露出はないものとします。
enum AgeLevel {
    case everyone
    case everyoneButSemiNude
    case r15
}
