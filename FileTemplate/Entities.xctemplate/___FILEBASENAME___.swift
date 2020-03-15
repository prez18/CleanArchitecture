//___FILEHEADER___

import RxSwift


final class ___VARIABLE_SceneName___Presenter: ___VARIABLE_SceneName___UseCaseOutput {

    private weak var output: ___VARIABLE_SceneName___PresenterOutput!
    
    init() {
        
    }

}

// アプリケーションロジックの処理結果を画面に最適な形式に変換してUIに通知する．
extension ___VARIABLE_SceneName___Presenter: LoginUseCaseOutput {
    // 以下，例
    
    // func branckUserName() {
    //     self.output.userNameNoteLabel(text: "必須項目です")
    // }
    
    // func brankPassword() {
    //     self.output.passwordNoteLabel(text: "必須項目です")
    // }
    
    // func error(message: Message) {
    //     View用のオブジェクトに変換する場合，見通しを良くするために変換オブジェクトを挟むことを検討する．
    //     let alertViewObject = AlertViewObjectTranslator(message: Message)
    //     self.output.showAlert(alertViewObject)
    // }
    
//    func presentIllustDetail() {
//        // TODO: 画面にドメインオブジェクトはここで渡すのが妥当な気もするけど
//    }
}
