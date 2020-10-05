//
//  ViewController.swift
//  simple
//
//  Created by andre on 10/5/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController Load")
        self.lbl.text = "Home Loading"
        
        // Re-render button
        self.loginButton.backgroundColor = .clear
        self.loginButton.layer.cornerRadius = 5
        self.loginButton.layer.borderWidth = 1
        
        self.emailTxt.clearButtonMode = .whileEditing

    }
    
    // Login Action
    @IBAction func loginAction(_ sender: Any) {
        print("Click to Login button")
        self.lbl.text = "Clicked in Login"
        self.avatarImage.image = UIImage(named: "img1.jpg")
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        print("Click to Sign Up button")
        self.lbl.text = "Clicked in Sign Up"
        
        // URL
        /*
        let imgUrl = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/505px-Apple_logo_black.svg.png")
        */
        let imgUrl = URL(string: "http://fotomicamesh.com/sites/default/files/styles/style_anh_lon_home/public/album/1_2.jpg?itok=Oajs8qbd")
        
        // DATA
        do {
            let imgData = try Data(contentsOf: imgUrl!)
            // Render
            avatarImage.image = UIImage(data: imgData)
        } catch {
            print("Can not load Image")
        }
        
  
    }
    

}

