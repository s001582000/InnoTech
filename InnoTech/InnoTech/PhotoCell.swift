//
//  PhotoCell.swift
//  InnoTech
//
//  Created by 梁雅軒 on 2020/8/21.
//  Copyright © 2020 梁雅軒. All rights reserved.
//

import UIKit
import SDWebImage
class PhotoCell: UITableViewCell {

    @IBOutlet weak var cstImageHeight: NSLayoutConstraint!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var imgvPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo(info:PhotoInfo, completedBlock:@escaping()->()) {
        imgvPhoto.sd_setImage(with: URL(string: info.thumbnailUrl)) { (image, error, type, url) in
            let height = image?.size.height ?? 0
            if self.cstImageHeight.constant != height {
                self.cstImageHeight.constant = height
                completedBlock()
            }
        }
        lblMessage.text = info.title
    }
    
}
