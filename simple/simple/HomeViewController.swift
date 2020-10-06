//
//  HomeViewController.swift
//  simple
//
//  Created by andre on 10/5/20.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    var emailParam:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.avatarImage.image = UIImage(named: "img1.jpg")
        self.emailLabel.text = self.emailParam
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
