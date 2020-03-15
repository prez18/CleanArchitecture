//
//  ContentSearchResult.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// コンテンツ検索結果
final class ContentSearchResult {
    /// 1ページごとのコンテンツ数
    let perpage: Int
    /// 何ページ目を検索しているか
    let page: Int
    /// 全検索ページ数
    let pages: Int
    /// 総コンテンツ数
    let total: Int
    /// 検索にヒットした作品一覧
    private(set) var contents: [ContentDescription]

    /// initailizer
    ///
    /// - Parameters:
    ///   - perpage: 1ページごとのコンテンツ数
    ///   - page: 何ページ目を検索しているか
    ///   - pages: 全検索ページ数
    ///   - total: 総コンテンツ数
    ///   - contents: 検索にヒットした作品一覧
    init(perpage: Int = 0,
        page: Int = 0,
        pages: Int = 0,
        total: Int = 0,
        contents: [ContentDescription] = []) {
        self.perpage = perpage
        self.page = page
        self.pages = pages
        self.total = total
        self.contents = contents
    }

}

extension ContentSearchResult: Equatable {
    static func == (lhs: ContentSearchResult, rhs: ContentSearchResult) -> Bool {
        return true
    }
}
