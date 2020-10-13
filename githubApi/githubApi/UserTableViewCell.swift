//
//  UserTableViewCell.swift
//  githubApi
//
//  Created by andre on 10/13/20.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var link: UILabel!
    @IBOutlet weak var follower: UILabel!
    @IBOutlet weak var following: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
