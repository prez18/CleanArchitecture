//___FILEHEADER___

import Foundation

protocol ___VARIABLE_SceneName___InteractorInput {
    // 例:
    // func authenticate(userId: String, password: String)
}

final class ___VARIABLE_SceneName___Interactor: ___VARIABLE_SceneName___InteractorInput {
    
    private let output: ___VARIABLE_SceneName___InteractorOutput
    // 必要に応じて，Gatewayなどを定義する
    // private let authGateway: AuthGateway
       
    // アプリケーションロジックで
    // 必要がなければ消す
    // private var isActivity: Bool = false {
    //     didSet {
    //         self.output.is(activity: self.isActivity)
    //     }
    // }
    
    init(output: ___VARIABLE_SceneName___InteractorOutput) {
        self.output = output
    }
    
    // ユーザーまたはシステムからのイベントを解釈して，アプリケーションロジックを定義する
    // メソッド名はユーザーの意思を表現するように命名する．
    // たとえば，確認ダイアログでOKをタップしたイベントに対する命名は「確認した」のような命名とする．
    // アプリケーションロジックは処理内容を命名で表現し切ることは無理であるため，このような命名とする．
    
    // privateメソッドは極力定義しないように心がける．
    
    // アプリケーションロジックは少ない記述になるように心がける．
    // Entitiesとして，あ汎用的な処理やバリデーション，制約などを表現するよう努力すること．
    // そのため，Interactor内ではprivateメソッドは極力定義しないように心がける．
    
    // 例: (ログインボタンをタップしたイベントに対応)
    // /// 認証する
    // ///
    // /// - Parameters:
    // ///   - userId: ユーザID
    // ///   - password: パスワード
    // func authenticate(userId: String, password: String) {
    //     guard let userId = try? UserId(value: userId) else {
    //         self.output.userIdIsEmpty()
    //         return
    //     }
    //     guard let password = try? Password(value: password) else {
    //         self.output.passwordIsEmpty()
    //         return
    //     }
    //     self.isActivity = true
    //     APIやSDKの呼び出しはGatewayインタフェースを切って実装する
    //     キャッシュのためのオブジェクトの操作やアクセストークンの設定や更新，エラー処理は，
    //     Gatewayの実装側でに隠蔽することを念頭に処理する．
    //     self.authGateway.authenticate(userId: userId, password: password) { result in
    //         switch result {
    //         case .success:
    //             self.output.presentSearchIllust()
    //         case .failure(let error):
    //             self.output.has(error: error)
    //         }
    //         self.isActivity = false
    //     }
    // }
}

// 外部に通知することを定義する
protocol ___VARIABLE_SceneName___InteractorOutput: AnyObject {
    // 例
    // 画面遷移
    // func presentSearchIllust()
    // 入力チェックエラー
    // func userIdIsEmpty()
    // func passwordIsEmpty()
    // エラーの場合
    // func has(error: Error)
    // 処理中
    // func `is`(activity: Bool)
}
