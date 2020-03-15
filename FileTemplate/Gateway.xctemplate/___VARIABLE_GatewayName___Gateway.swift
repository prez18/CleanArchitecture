//___FILEHEADER___

import Foundation

/// ___GatewayNameComment___
protocol ___VARIABLE_GatewayName___Gateway {
    // APIやSDKなどの処理の呼び出しを実施する
    // このとき，Interacctor層から呼び出しやすい形式で表現する．
    
    // 以下，ポイント
    // APIやDatabaseという表現は出ないようにする．
    // キャッシュフラグを定義して，キャッシュから取得する，とかはできるようにして良い．
    // APIから取得したデータをキャッシュするためにDBに保存したりの処理がInteractor層に出ないように心がける．
    // アクセストークンやデバイス種別などAPI特有の内容はインタフェースに出ないように心がける．
    // 引数や戻り値は，Interactorで扱いやすい形式で表現する．
    // Codable適応により微妙に歪なオブジェクトや，Realmオブジェクトをcompletionで戻したりはしない．

    // 例:
    // func search(for conf: ContentSearchConfigration,
    // useCash: Bool,
    // complition: @escaping (Result<ContentSearchResult, Error>) -> ())
    // func cancel()
}
