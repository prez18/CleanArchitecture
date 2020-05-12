//
//  IndicatorView.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import UIKit

final class IndicatorView: UIView {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNib()
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNib()
        self.setup()
    }
    
    func setup() {
        self.isHidden = true
    }
    
    func start() {
        self.activityIndicatorView.startAnimating()
        self.isHidden = false
    }
    
    func stop() {
        self.isHidden = true
        self.activityIndicatorView.stopAnimating()
    }
}
