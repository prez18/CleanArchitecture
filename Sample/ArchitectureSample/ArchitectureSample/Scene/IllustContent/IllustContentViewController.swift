//
//  IllustContentViewController.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import UIKit

/// イラスト作品画面
final class IllustContentViewController: UIViewController {

    /// インジケータビュー
    lazy var indicatorView: IndicatorView = {
        let indicatorView = IndicatorView()
        self.view.addAndFit(subview: indicatorView)
        return indicatorView
    }()
    
    private var interactor: IllustContentInteractorInput!
    
    func inject(interactor: IllustContentInteractorInput) {
        self.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.interactor.seeIllust()
    }
    
    func setup() {
        // UIコントロールなどの設定
    }

}

extension IllustContentViewController: IllustContentPresenterOutput {
    
     func show(errorMessage: String) {
         DispatchQueue.main.async {
             let alert = UIAlertController(title: "エラー", message: errorMessage, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default))
             self.present(alert, animated: true)
         }
     }
    
     func indicator(isHidden: Bool) {
         DispatchQueue.main.async {
             if isHidden {
                 self.indicatorView.stop()
             } else {
                 self.indicatorView.start()
             }
         }
     }
    
    func contentInfo(viewModel: ContentInfoViewModel) {
        // ビューにviewModelを反映
    }
    
}
