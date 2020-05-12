//
//  Contents.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// コンテンツ
///
/// - illust: イラストコンテンツ
/// - manga: 漫画コンテンツ
/// - model: モデルコンテンツ(模型とかフィギュアのこと)
/// - novel: 小説コンテンツ
/// - cosplay: コスプレ
enum Contents {
    case illust([ImageContent])
    case manga([ImageContent])
    case model([ImageContent])
    case novel([HtmlContent])
    case cosplay([ImageContent])
}
