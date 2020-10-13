//
//  UsersCell.swift
//  slideMenu
//
//  Created by andre on 10/12/20.
//

import UIKit

class UsersCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
