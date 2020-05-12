//
//  ContentInfoGateway.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import Foundation

protocol ContentInfoGateway {
    func read(parameter: ContentInfoParameter, complition: @escaping (Result<ContentInfo, Error>) -> ())
    func read(parameter: ContentInfoParameter, useCash: Bool, complition: @escaping (Result<ContentInfo, Error>) -> ())
}

/// 作品情報パラメータ
struct ContentInfoParameter {
    /// コンテンツId
    let contentsId: ContentId
    /// 作品の投稿日時も取得したい場合true，そうではない場合false
    let isGetDates: Bool
    /// 複数枚のモデル画像を取得したい場合はtrue，そうでない場合はfalse
    let isGetMultipleModels: Bool

    init(contentsId: ContentId,
        isGetDates: Bool = true,
        isGetMultipleModels: Bool = true) {
        self.contentsId = contentsId
        self.isGetDates = isGetDates
        self.isGetMultipleModels = isGetMultipleModels
    }
}
