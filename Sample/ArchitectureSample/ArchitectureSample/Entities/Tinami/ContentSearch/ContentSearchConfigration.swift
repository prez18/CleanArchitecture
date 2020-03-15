//
//  ContentsSearchConfigration.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

/// 作品検索設定
final class ContentSearchConfigration {
    /// キーワード
    private(set) var text: [String]
    /// タグ
    let tags: [String]
    /// 検索条件
    let search: SearchCondition
    /// 検索ソート順
    let sort: Sort
    /// 検索対象にするコンテンツ
    let contType: [ContentType]
    /// 表示ページ．指定しない場合は1ページが表示されます．
    private(set) var page: Int
    /// １つのページの表示件数．指定しない場合は20件になります．
    let perpage: Int
    /// プロフィールID．お気に入りの取得および作品情報の取得のレスポンスに含まれる，<creator id="xxxx">の値を設定して下さい．
    let profId: String?
    /// trueを指定するとアダルトコンテンツを含まない．falseを指定していても認証していない場合は含まれません．指定しない場合はtrueとなります．
    // トグルで設定を変えたい場合は?
    let isSafe: Bool

    /// initializer
    ///
    /// - Parameters:
    ///   - text: キーワード
    ///   - tags: タグ
    ///   - search: 検索条件
    ///   - sort: 検索ソート順
    ///   - contType: 検索対象にするコンテンツ
    ///   - perpage: １つのページの表示件数．指定しない場合は20件になります．
    ///   - profId: プロフィールID．お気に入りの取得，および作品情報の取得のレスポンスに含まれる，<creator id="xxxx">の値を設定して下さい．
    ///   - isSafe: trueを指定するとアダルトコンテンツを含まない．falseを指定していても認証していない場合は含まれません．指定しない場合はtrueとなります
    init(text: [String] = [],
        tags: [String] = [],
        search: SearchCondition = .and,
        sort: Sort = Sort.new,
        contType: [ContentType] = [.illust],
        perpage: Int = 100,
        profId: String? = nil,
        isSafe: Bool = true) {
        self.text = text
        self.tags = tags
        self.search = search
        self.sort = sort
        self.contType = contType
        self.page = 1
        self.perpage = perpage
        self.profId = profId
        self.isSafe = isSafe
    }

    /// 次のページを設定する
    func pagingToNext() {
        self.page += 1
    }

    /// ページングをリセットする
    func resetPaging() {
        self.page = 1
    }
}
