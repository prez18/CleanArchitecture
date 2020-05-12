//
//  ContentInfoViewModel.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

struct ContentInfoViewModel {
    /// タイトル
    let title: String
    /// 説明
    let description: String
    /// お気に入りか
    let isCollection: Bool
    /// タグ
    let tags: [String]
    /// 投稿日時
    let dates: String
    /// クリエイター情報
    let creator: Creator
    /// コンテンツ
     let contents: [ImageContent]
    /// 総閲覧数
    let totalView: String
    /// 閲覧したユーザ数
    let userView: String
    /// 評価
    let valuation: String
}
