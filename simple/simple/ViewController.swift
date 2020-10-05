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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController Load")
        self.lbl.text = "Home Loading"
        
        // Re-render button
        loginButton.backgroundColor = .clear
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        
        emailTxt.clearButtonMode = .whileEditing
    }
    
    // Login Action
    @IBAction func loginAction(_ sender: Any) {
        print("Click to Login button")
        self.lbl.text = "Clicked in Login"
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        print("Click to Sign Up button")
        self.lbl.text = "Clicked in Sign Up"
    }
    

}

