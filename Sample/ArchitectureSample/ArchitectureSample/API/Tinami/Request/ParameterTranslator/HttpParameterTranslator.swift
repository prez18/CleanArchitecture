//
//  HttpParameterTranslator.swift
//  RemoteDataStore
//
//  Created by prez on 2019/06/03.
//  Copyright © 2019 prez. All rights reserved.
//

import Foundation

struct AuthHttpParameterTranslator {
    func translate(_ format: Format, userId: UserId, password: Password) -> [QueryItem] {
        var httpParameter: [QueryItem] = []
        httpParameter.append(QueryItem(key: "api_key", value: tinamiApiKey))
        httpParameter.append(QueryItem(key: "email", value: userId.value))
        httpParameter.append(QueryItem(key: "password", value: password.value))
        httpParameter.append(QueryItem(key: "format", value: format.rawValue))
        return httpParameter
    }
}
