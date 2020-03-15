//
//  illustTimelineViewModelTranslator.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

struct IllustTimelineViewModelTranslator {
    func translate(_ searchedContentDescriptionList: SearchedContentDescriptionList) -> IllustTimelineViewModel {
        let illustDescriptionViewModels = searchedContentDescriptionList.value.map {
            return IllustDescriptionViewModel(title: $0.title, thumbnail: $0.thumbnail.url)
        }
        let illustTimelineViewModel = IllustTimelineViewModel(illustDescriptionViewModels: illustDescriptionViewModels)
        return illustTimelineViewModel
    }
}
