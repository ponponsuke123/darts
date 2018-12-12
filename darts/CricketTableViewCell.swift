//
//  CricketTableViewCell.swift
//  darts
//
//  Created by nttr on 2018/12/04.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit

class CricketTableViewCell: UITableViewCell {
    @IBOutlet var displayLable: UILabel!
    @IBOutlet var markImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
