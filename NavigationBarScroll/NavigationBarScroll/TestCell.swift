//
//  TestCell.swift
//  NavigationBarScroll
//
//  Created by fei on 2017/8/22.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet var contentLbl: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
