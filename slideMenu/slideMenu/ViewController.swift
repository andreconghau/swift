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
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }

    @IBAction func showMenu(_ sender: Any) {
        present(sideMenu, animated: true)
    }
    
}

class MenuController: UITableViewController {
    
    private var menuItems: [String]
    
    init(with menuItems: [String]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ITEMS")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ITEMS", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Replay to delegate about item slection
        // StoryBoard.
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        var defaultScreen = "screen-1"
        
        
        switch indexPath.row {
        case 0:
            defaultScreen = "screen-1"
        case 1:
            defaultScreen = "screen-2"
        case 2:
            defaultScreen = "screen-3"
        case 4:
            defaultScreen = "screen-4"
        default:
            defaultScreen = "screen-1"
        }
        // Tao ViewController Sence
        let homeSence = mainSB.instantiateViewController(identifier: defaultScreen) as! HomeViewController
        self.navigationController?.pushViewController(homeSence, animated: true)
    }
}
