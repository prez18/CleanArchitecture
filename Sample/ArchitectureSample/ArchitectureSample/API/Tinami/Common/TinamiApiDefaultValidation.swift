//
//  TinamiApiDefaultValidation.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

struct TinamiApiDefaultValidation: ResponseValidation {
    
    /// レスポンスを検証する
    ///
    /// - Parameter data: 検証対象のデータ
    /// - Throws: 検証の結果，不正であると判断された場合
    public func validate(for data: Data) throws {
        guard let jsonObject: Any = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
            let jsonDictionay: NSDictionary = jsonObject as? NSDictionary,
            let state: String = jsonDictionay["stat"] as? String else {
                throw TinamiApiError.stateのパースに失敗した場合
        }
        if state == "fail" {
            guard let err = jsonDictionay["err"] as? NSDictionary,
                let _ = err["msg"] as? String else {
                    throw TinamiApiError.stateがfailであるときに，msgのパースに失敗した場合
            }
            if state != "ok" {
                throw TinamiApiError.stateがfailでもokでもない場合
            }
        }
    }
    
    enum TinamiApiError: Error {
        case stateのパースに失敗した場合
        case stateがfailであるときに，msgのパースに失敗した場合
        case stateがfailであり，msgは取得できた場合
        case stateがfailでもokでもない場合
        
        var message: String {
            switch self {
            case .stateのパースに失敗した場合:
                return "1"
            case .stateがfailであるときに，msgのパースに失敗した場合:
                return "2"
            case .stateがfailであり，msgは取得できた場合:
                return "3"
            case .stateがfailでもokでもない場合:
                return "4"
            }
        }
    }
}
