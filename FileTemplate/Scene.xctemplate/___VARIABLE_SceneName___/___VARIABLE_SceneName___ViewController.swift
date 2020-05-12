//___FILEHEADER___

import UIKit

/// ___VARIABLE_SceneNameComment___画面
final class ___VARIABLE_SceneName___ViewController: UIViewController {

    // 例:
    // /// ユーザIDテキストフィールド
    // @IBOutlet weak var userIdTextField: UITextField!
    // /// ユーザID備考テキストフィールド
    // @IBOutlet weak var userIdNoteLabel: UILabel!
    // /// パスワードテキストフィールド
    // @IBOutlet weak var passwordTextField: UITextField!
    // /// パスワード備考テキストフィールド
    // @IBOutlet weak var passwordNoteLabel: UILabel!
    /// インジケータビュー
    // lazy var indicatorView: IndicatorView = {
    //     let indicatorView = IndicatorView()
    //     self.view.addAndFit(subview: indicatorView)
    //     return indicatorView
    // }()
    
    private var interactor: ___VARIABLE_SceneName___InteractorInput!
    
    func inject(interactor: ___VARIABLE_SceneName___InteractorInput) {
        self.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        // UIコントロールなどの設定
    }
    
    // @IBAction func loginButtonTouchUpInside(_ sender: UIButton) {
    // UIコントロールからのイベントを解釈してInteractorを実行する
    //     self.interactor.authenticate(userId: self.userIdTextField.text ?? "",
    //                           password: self.passwordTextField.text ?? "")
    // }

}

extension ___VARIABLE_SceneName___ViewController: ___VARIABLE_SceneName___PresenterOutput {

    // 例:
    // func transitionToHome() {
    //     DispatchQueue.main.async {
    //         let vc = IllustTimelineBuilder().build()
    //         vc.modalPresentationStyle = .fullScreen
    //         self.present(vc, animated: true)
    //     }
    // }
    
    // func userIdNote(text: String) {
    //     DispatchQueue.main.async {
    //         self.userIdNoteLabel.text = text
    //     }
    // }
    
    // func passwordNote(text: String) {
    //     DispatchQueue.main.async {
    //         self.passwordNoteLabel.text = text
    //     }
    // }
    
    // func show(errorMessage: String) {
    //     DispatchQueue.main.async {
    //         let alert = UIAlertController(title: "ログイン失敗", message: errorMessage, preferredStyle: .alert)
    //         alert.addAction(UIAlertAction(title: "OK", style: .default))
    //         self.present(alert, animated: true)
    //     }
    // }
    
    // func indicator(isHidden: Bool) {
    //     DispatchQueue.main.async {
    //         if isHidden {
    //             self.indicatorView.stop()
    //         } else {
    //             self.indicatorView.start()
    //         }
    //     }
    // }
    
}
