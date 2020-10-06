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
    
    @IBOutlet weak var singupImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Step1")
        self.lbl.text = "Home Loading"
        
        // Re-render button
        // self.loginButton.backgroundColor = .clear
        self.loginButton.layer.cornerRadius = 5
        self.loginButton.layer.borderWidth = 1
        
        self.emailTxt.clearButtonMode = .whileEditing

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Step2")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Step3")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Step4")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Step5")
    }
    
    // Login Action
    @IBAction func loginAction(_ sender: Any) {
        print("Click to Login button")
        self.lbl.text = "Clicked in Login"
        
        
        let emailInput = self.emailTxt.text
        print(emailInput ?? "")
        
        // StoryBoard.
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        // Tao ViewController Sence
        let homeSence = mainSB.instantiateViewController(identifier: "HomeView") as! HomeViewController
        homeSence.emailParam = emailInput ?? "Chua nhap gi het"
        self.navigationController?.pushViewController(homeSence, animated: true)
        
        // Navigation PUSH or POP
        
        
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
            singupImage.image = UIImage(data: imgData)
        } catch {
            print("Can not load Image")
        }
        
  
    }
    

}

