//
//  ContentDescription.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 作品概要
final class ContentDescription {
    /// id
    let id: ContentId
    /// 作品の種類
    let type: ContentType
    /// タイトル
    let title: String
    /// 公開レベル
    let viewLevel: ViewLevel
    /// 年齢制限
    let ageLevel: AgeLevel
    /// サムネイル
    let thumbnail: Thumbnail

    /// initializer
    ///
    /// - Parameters:
    ///   - id: id
    ///   - type: 作品の種類
    ///   - title: タイトル
    ///   - viewLevel: 公開レベル
    ///   - ageLevel: 年齢制限
    ///   - thumbnail: サムネイル
    init(id: ContentId,
        type: ContentType,
        title: String,
        viewLevel: ViewLevel,
        ageLevel: AgeLevel,
        thumbnail: Thumbnail) {
        self.id = id
        self.type = type
        self.title = title
        self.viewLevel = viewLevel
        self.ageLevel = ageLevel
        self.thumbnail = thumbnail
    }
}

extension ContentDescription: Equatable {
    
    static func == (lhs: ContentDescription, rhs: ContentDescription) -> Bool {
        return lhs.id == rhs.id
    }
    
}
