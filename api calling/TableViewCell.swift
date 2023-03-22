//
//  TableViewCell.swift
//  api calling
//
//  Created by R94 on 20/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lable1: UILabel!
    
    @IBOutlet weak var lable2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
