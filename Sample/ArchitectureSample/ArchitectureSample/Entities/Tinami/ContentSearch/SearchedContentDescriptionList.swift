//
//  IllustDescriptionList.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 検索された作品一覧
final class SearchedContentDescriptionList {
    /// 作品一覧
    private(set) var value: [ContentDescription] = []
    
    /// 検索ページ
    private var page: Int = 0
    
    func clear() {
        self.value.removeAll()
        self.page = 0
    }
    
    func add(_ contentSearchResult: ContentSearchResult) {
        guard contentSearchResult.page == self.page + 1 else {
            assert(false, "現在の次のページのみ追加できる")
            return
        }
        self.page = contentSearchResult.page
        self.value += contentSearchResult.contents
    }

}
