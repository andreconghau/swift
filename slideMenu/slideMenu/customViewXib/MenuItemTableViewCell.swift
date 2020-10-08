//
//  MenuItemTableViewCell.swift
//  slideMenu
//
//  Created by andre on 10/8/20.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("cell")
        // Configure the view for the selected state
    }
    
}
