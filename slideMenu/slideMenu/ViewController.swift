//
//  ViewController.swift
//  slideMenu
//
//  Created by andre on 10/8/20.
//

import UIKit
import SideMenu

class ViewController: UIViewController  {
    
    
    let sideMenu = SideMenuNavigationController(rootViewController: MenuController(with: ["Green", "Orange", "Blue", "Red"]))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }

    @IBAction func showMenu(_ sender: Any) {
        present(sideMenu, animated: true)
    }
    
}


