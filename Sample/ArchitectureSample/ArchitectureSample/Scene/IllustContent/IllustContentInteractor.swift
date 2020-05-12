//
//  IllustContentInteractor.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol IllustContentInteractorInput {
    func seeIllust()
}

final class IllustContentInteractor: IllustContentInteractorInput {
    
    private let output: IllustContentInteractorOutput
    private let contentDescription: ContentDescription
    private var contentInfo: ContentInfo?
    
    private let contentInfoGateway: ContentInfoGateway
    
    private var isActivity: Bool = false {
        didSet {
            self.output.is(activity: self.isActivity)
        }
    }
    
    init(output: IllustContentInteractorOutput,
         contentDescription: ContentDescription,
         contentInfoGateway: ContentInfoGateway) {
        self.output = output
        self.contentDescription = contentDescription
        self.contentInfoGateway = contentInfoGateway
    }
    
    /// イラストを見る
    func seeIllust() {
        self.isActivity = true
        let parameter = ContentInfoParameter(contentsId: self.contentDescription.id)
        self.contentInfoGateway.read(parameter: parameter) { result in
            switch result {
            case .success(let contentInfo):
                self.contentInfo = contentInfo
                self.output.display(contentInfo)
            case .failure(let error):
                self.output.has(error: error)
            }
            self.isActivity = false
        }
    }
    
}

protocol IllustContentInteractorOutput: AnyObject {
    func display(_ contentInfo: ContentInfo)
    func has(error: Error)
    func `is`(activity: Bool)
}
