//
//  IllustTimelineInteractor.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

protocol IllustTimelineInteractorInput {
    /// 新着イラストを見る
    func seeNewIllust()
    /// 新着イラストをさらに見る
    func seeMoreNewIllust()
    /// 新着イラストの検索を更新する
    func refresh()
    /// イラストの詳細を見る
    func seeIllustDetail(of index: Int)
}

final class IllustTimelineInteractor: IllustTimelineInteractorInput {
    
    private let contentSearchGateway: ContentSearchGateway
    private let output: IllustTimelineInteractorOutput
    /// 検索設定
    private let searchConfigration = ContentSearchConfigration(sort: .new, contType: [.illust])
    /// 検索結果リスト
    private var searchedIllustDescriptionList: SearchedContentDescriptionList
    /// 検索中か
    private var isSearching: Bool = false {
        didSet {
            self.output.is(searching: self.isSearching)
        }
    }
    
    init(output: IllustTimelineInteractorOutput,
         contentSearchGateway: ContentSearchGateway) {
        self.output = output
        self.contentSearchGateway = contentSearchGateway
        self.searchedIllustDescriptionList = SearchedContentDescriptionList()
    }
    
    /// 新着イラストを見る
    func seeNewIllust() {
        self.isSearching = true
        self.contentSearchGateway.search(for: self.searchConfigration) { result in
            switch result {
            case .success(let contentSearchResult):
                self.searchedIllustDescriptionList.add(contentSearchResult)
                self.output.display(self.searchedIllustDescriptionList)
            case .failure(let error):
                self.output.has(error: error)
            }
            self.isSearching = false
        }
    }
        
    /// 新着イラストをさらに見る
    func seeMoreNewIllust() {
        guard !self.isSearching else {
            return
        }
        self.isSearching = true
        self.searchConfigration.pagingToNext()
        self.contentSearchGateway.search(for: self.searchConfigration) { result in
            switch result {
            case .success(let contentSearchResult):
                self.searchedIllustDescriptionList.add(contentSearchResult)
                self.output.display(self.searchedIllustDescriptionList)
            case .failure(let error):
                self.output.has(error: error)
            }
            self.isSearching = false
        }
    }
    
    /// 新着イラストの検索を更新する
    func refresh() {
        self.isSearching = true
        self.searchedIllustDescriptionList.clear()
        self.searchConfigration.resetPaging()
        self.contentSearchGateway.search(for: self.searchConfigration) { result in
            switch result {
            case .success(let contentSearchResult):
                self.searchedIllustDescriptionList.add(contentSearchResult)
                self.output.display(self.searchedIllustDescriptionList)
            case .failure(let error):
                self.output.has(error: error)
            }
            self.isSearching = false
        }
    }
    
    /// イラストの詳細を見る
    func seeIllustDetail(of index: Int) {
        let contentDescription = self.searchedIllustDescriptionList.value[index]
        // イラストの詳細を表示する
        self.output.presentIllustDetail(contentDescription: contentDescription)
    }
    
}

protocol IllustTimelineInteractorOutput: AnyObject {
    func has(error: Error)
    func `is`(searching: Bool)
    func display(_ searchedContentDescriptionList: SearchedContentDescriptionList)
    func presentIllustDetail(contentDescription: ContentDescription)
}
