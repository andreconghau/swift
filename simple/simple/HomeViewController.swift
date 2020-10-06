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
    
    @IBAction func goHomeAction(_ sender: Any) {
        // Mặc định lùi về trước đó 1 screen
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func goRootAction(_ sender: Any) {
        // Trở về root Screen
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func backToViewAction(_ sender: Any) {
        // viewControllers sẽ trả về array các item đã được push trước đó ứng với 1 screen
        let screens = self.navigationController?.viewControllers
        self.navigationController?.popToViewController((screens?[0])!, animated: true)
    }
    
    @IBAction func goListVewAction(_ sender: Any) {
        // StoryBoard.
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        // Tao ViewController Sence
        let listSence = mainSB.instantiateViewController(identifier: "ListView") as! ListViewController
        self.navigationController?.pushViewController(listSence, animated: true)
        
        
    }
    
    
    
}
