//___FILEHEADER___

import Foundation

/// ___ApiNameComment___
protocol ___VARIABLE_ApiName___Api {
    // APIの処理の呼び出しを実施する
    // このとき，Interacctor層から呼び出しやすい形式で表現する．
    
    // 以下，ポイント
    // Codable適応により微妙に歪なオブジェクトや，Realmオブジェクトをcompletionで戻したりはしない．

    // 例:
    // func search(for conf: ContentSearchConfigration,
    // complition: @escaping (Result<ContentSearchResult, Error>) -> ())
}
