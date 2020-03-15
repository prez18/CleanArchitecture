//
//  IllustContentPresenter.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class IllustContentPresenter: IllustContentInteractorOutput {

    private weak var output: IllustContentPresenterOutput!
    
    init(output: IllustContentPresenterOutput) {
        self.output = output
    }
    
    func display(_ contentInfo: ContentInfo) {
        let viewModel = ContentInfoViewModelTranslator().translate(contentInfo)
        self.output.contentInfo(viewModel: viewModel)
    }
    
    func has(error: Error) {
        self.output.show(errorMessage: error.localizedDescription)
    }
    
    func `is`(activity: Bool) {
        self.output.indicator(isHidden: !activity)
    }
    
}

protocol IllustContentPresenterOutput: AnyObject {
    func indicator(isHidden: Bool)
    func show(errorMessage: String)
    func contentInfo(viewModel: ContentInfoViewModel)
}
