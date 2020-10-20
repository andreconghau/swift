//
//  BookTableViewCell.swift
//  realmdata
//
//  Created by andre on 10/19/20.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
