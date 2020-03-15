//
//  ContentInfo.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 作品情報
final class ContentInfo {
    /// タイトル
    let title: String
    /// 説明
    let description: String
    /// サポートしているか
    let isSupport: Bool
    /// お気に入りか
    private(set) var isCollection: Bool
    /// タグ
    let tags: [String]
    /// 投稿日時
    let dates: Date?
    /// クリエイター情報
    let creator: Creator
    /// コンテンツ(コンテンツの種類はここで判定できる)
    let contents: Contents
    /// 総閲覧数
    let totalView: Int
    /// 閲覧したユーザ数
    let userView: Int
    /// 評価
    let valuation: Int

    init(type _: ContentType,
        title: String,
        description: String,
        isSupport: Bool,
        isCollection: Bool,
        tags: [String],
        dates: Date,
        creator: Creator,
        contents: Contents,
        totalView: Int,
        userView: Int,
        valuation: Int) {
        self.title = title
        self.description = description
        self.isSupport = isSupport
        self.isCollection = isCollection
        self.tags = tags
        self.dates = dates
        self.creator = creator
        self.contents = contents
        self.totalView = totalView
        self.userView = userView
        self.valuation = valuation
    }

    /// お気に入りにする
    func favo() {
        self.isCollection = true
    }
}
