//
//  IllustTimelinePresenter.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/23.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class IllustTimelinePresenter {
    
    private weak var output: IllustTimelinePresenterOutput!
    
    init(output: IllustTimelinePresenterOutput) {
        self.output = output
    }

}

extension IllustTimelinePresenter: IllustTimelineInteractorOutput {
    
    func has(error: Error) {
        self.output.show(errorMessage: error.localizedDescription)
    }
    
    func `is`(searching: Bool) {
        self.output.indicatorView(isHidden: !searching)
    }
    
    func display(_ searchedContentDescriptionList: SearchedContentDescriptionList) {
        let viewModel = IllustTimelineViewModelTranslator()
            .translate(searchedContentDescriptionList)
        self.output.timeline(viewModel: viewModel)
    }
    
    func presentIllustDetail(contentDescription: ContentDescription) {
        self.output.transitionToIllustDetail(contentDescription: contentDescription)
    }
    
}

protocol IllustTimelinePresenterOutput: AnyObject {
    /// エラーメッセージを表示する
    func show(errorMessage: String)
    /// インジケータビューの表示状態
    func indicatorView(isHidden: Bool)
    /// タイムライン
    func timeline(viewModel: IllustTimelineViewModel)
    /// イラスト詳細画面に遷移する
    func transitionToIllustDetail(contentDescription: ContentDescription)
}
