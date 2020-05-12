//
//  AuthInteractor.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/15.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol AuthInteractorInput {
    func authenticate(userId: String, password: String)
}

final class AuthInteractor: AuthInteractorInput {
    
    private let output: AuthInteractorOutput
    private let authGateway: AuthGateway
        
    private var isActivity: Bool = false {
        didSet {
            self.output.is(activity: self.isActivity)
        }
    }
    
    init(output: AuthInteractorOutput,
         authGateway: AuthGateway) {
        self.output = output
        self.authGateway = authGateway
    }
    
    /// 認証する
    ///
    /// - Parameters:
    ///   - userId: ユーザID
    ///   - password: パスワード
    func authenticate(userId: String, password: String) {
        guard let userId = try? UserId(value: userId) else {
            self.output.userIdIsEmpty()
            return
        }
        guard let password = try? Password(value: password) else {
            self.output.passwordIsEmpty()
            return
        }
        self.isActivity = true
        self.authGateway.authenticate(userId: userId, password: password) { result in
            switch result {
            case .success:
                self.output.presentSearchIllust()
            case .failure(let error):
                self.output.has(error: error)
            }
            self.isActivity = false
        }
    }
}

protocol AuthInteractorOutput: AnyObject {
    func presentSearchIllust()
    func userIdIsEmpty()
    func passwordIsEmpty()
    func has(error: Error)
    func `is`(activity: Bool)
}
