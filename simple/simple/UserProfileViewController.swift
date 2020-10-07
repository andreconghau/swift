//
//  UserProfileViewController.swift
//  simple
//
//  Created by andre on 10/7/20.
//

import UIKit

class UserProfileViewController: UIViewController {

    var userInfo:User!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.userInfo.avatar)
        self.title?.append(" " + self.userInfo.name)
        
        let imgUrl = URL(string: self.userInfo.avatar)
        
        // DATA
        do {
            let imgData = try Data(contentsOf: imgUrl!)
            // Render

            //self.view.backgroundColor = UIColor(patternImage: UIImage(data: imgData)!)
            self.imageProfile.image = UIImage(data: imgData)
        } catch {
            // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "non-avatar.png")!)
            self.imageProfile.image = UIImage(named: "non-avatar.png")
        }
        
        
        // Do any additional setup after loading the view.
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
