//
//  IllustDescriptionTableViewCell.swift
//  ArchitectureSample
//
//  Created by prez on 2020/03/14.
//  Copyright © 2020 prez. All rights reserved.
//

import UIKit
import Kingfisher

final class IllustDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(viewModel: IllustDescriptionViewModel) {
        self.titleLabel.text = viewModel.title
        self.thumbnailImageView.kf.setImage(with: viewModel.thumbnail)
    }
    
}
