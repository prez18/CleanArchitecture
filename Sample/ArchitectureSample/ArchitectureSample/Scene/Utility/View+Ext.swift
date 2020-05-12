//
//  View+Ext.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Nibをロードする
    ///
    /// NOTE: ファイル名とクラス名が一致している必要がある．
    func loadNib() {
        guard let view = UINib(nibName: String(describing:  type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            assert(false, "ファイル名とクラス名が一致している必要があります．")
            return
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    
    /// addSubViewして上下左右くっつく制約を付与する
    /// - Parameter subview: サブビュー
    func addAndFit(subview:UIView) {

        self.addSubview(subview)
        
        subview.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            subview.leftAnchor.constraint(equalTo: leftAnchor),
            subview.rightAnchor.constraint(equalTo: rightAnchor),
            subview.topAnchor.constraint(equalTo: topAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
