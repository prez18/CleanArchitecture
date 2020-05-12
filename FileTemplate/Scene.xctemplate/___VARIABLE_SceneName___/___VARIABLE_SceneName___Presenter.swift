//___FILEHEADER___

import Foundation

final class ___VARIABLE_SceneName___Presenter: ___VARIABLE_SceneName___InteractorOutput {

    private weak var output: ___VARIABLE_SceneName___PresenterOutput!
    
    init(output: ___VARIABLE_SceneName___PresenterOutput) {
        self.output = output
    }
    
    // Interactorからの出力をViewに最適な形式に変換して，Viewにレンダリングの指示を出す
    
    // 例:
    // func presentSearchIllust() {
    //     self.output.transitionToHome()
    // }
    
    // func userIdIsEmpty() {
    //     self.output.userIdNote(text: "必須項目です")
    // }
    
    // func passwordIsEmpty() {
    //     self.output.passwordNote(text: "必須項目です")
    // }
    
    // func has(error: Error) {
    //     self.output.show(errorMessage: error.localizedDescription)
    // }
    
    // func `is`(activity: Bool) {
    //     self.output.indicator(isHidden: !activity)
    // }
}

protocol ___VARIABLE_SceneName___PresenterOutput: AnyObject {
    // UIに出力する処理を定義する
    // 例
    // 画面遷移
    // func transitionToHome()
    // UI名+プロパティ名
    // func userIdNote(text: String)
    // func passwordNote(text: String)
    // func indicator(isHidden: Bool)
    // (アラートなど)メッセージを表示する
    // func show(errorMessage: String)
}
