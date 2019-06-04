//
//  TableViewCell.swift
//  JSONUrlParserWithTabBar
//
//  Created by Greeens5 on 04/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
