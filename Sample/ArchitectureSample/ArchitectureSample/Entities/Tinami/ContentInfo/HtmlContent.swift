//
//  HtmlContent.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// HTML形式のコンテンツ
struct HtmlContent {
    /// HTMLコンテンツのURL
    let htmlUrl: URL

    init(htmlUrl: URL) {
        self.htmlUrl = htmlUrl
    }
}
