//
//  ContentInfoViewModelTranslator.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

struct ContentInfoViewModelTranslator {
    
    func translate(_ contentInfo: ContentInfo) -> ContentInfoViewModel {
        let contents: [ImageContent] = {
            switch contentInfo.contents {
            case .illust(let value):
                return value
            default:
                return []
            }
        }()
        let dates: String = {
            guard let dates = contentInfo.dates else {
                assert(false, "日付は必ず取得できる")
                return ""
            }
            let formatter: DateFormatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: dates)
        }()
        let viewModel = ContentInfoViewModel(title: contentInfo.title,
                                             description: contentInfo.description,
                                             isCollection: contentInfo.isCollection,
                                             tags: contentInfo.tags,
                                             dates: dates,
                                             creator: contentInfo.creator,
                                             contents: contents,
                                             totalView: "\(contentInfo.totalView)",
            userView: "\(contentInfo.userView)",
            valuation: "\(contentInfo.valuation)")
        return viewModel
    }
    
}
