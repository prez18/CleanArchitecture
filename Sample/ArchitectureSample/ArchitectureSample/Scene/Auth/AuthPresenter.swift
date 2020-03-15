//
//  AuthPresenter.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

final class AuthPresenter: AuthInteractorOutput {

    private weak var output: AuthPresenterOutput!
    
    init(output: AuthPresenterOutput) {
        self.output = output
    }
    
    func presentSearchIllust() {
        self.output.transitionToHome()
    }
    
    func userIdIsEmpty() {
        self.output.userIdNote(text: "必須項目です")
    }
    
    func passwordIsEmpty() {
        self.output.passwordNote(text: "必須項目です")
    }
    
    func has(error: Error) {
        self.output.show(errorMessage: error.localizedDescription)
    }
    
    func `is`(activity: Bool) {
        self.output.indicator(isHidden: !activity)
    }
}

protocol AuthPresenterOutput: AnyObject {
    func transitionToHome()
    func userIdNote(text: String)
    func passwordNote(text: String)
    func show(errorMessage: String)
    func indicator(isHidden: Bool)
}
