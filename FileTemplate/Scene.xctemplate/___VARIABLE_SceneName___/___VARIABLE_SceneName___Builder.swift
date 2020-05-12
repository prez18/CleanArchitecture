//___FILEHEADER___

import Foundation

final class ___VARIABLE_SceneName___Builder {
    func build() -> ___VARIABLE_SceneName___ViewController {
        let vc = ___VARIABLE_SceneName___ViewController()
        let presenter = ___VARIABLE_SceneName___Presenter(output: vc)
        let interactor = ___VARIABLE_SceneName___Interactor(output: presenter)
        vc.inject(interactor: interactor)
        return vc
    }
}
