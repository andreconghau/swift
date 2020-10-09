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
    // let sideMenu = SideMenuNavigationController(rootViewController: MenuTableViewController())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        


        demoGetMethod()
        
        
    }

    @IBAction func showMenu(_ sender: Any) {
        present(sideMenu, animated: true)
    }
    
    func demoPostRequest() {
        
        // URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        guard url != nil else {
            print("URL required")
            return
        }
        
        // URL request
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        // Specify Header
       let header = ["Content-type":"application/json"]
        
        request.allHTTPHeaderFields = header
        
        // Specify Body
//        let json_body = [
//            "key1":"value1",
//            "key2":"value2"
//        ] as [String:Any]
//
//        do {
//            let request_body = try JSONSerialization.data(withJSONObject: json_body, options: .fragmentsAllowed)
//            request.httpBody = request_body
//        } catch {
//            print("Json Convert Failded")
//        }
//
        
        // Set the request type
        request.httpMethod = "GET"
        
        // Get the URL Session
        let session = URLSession.shared

        // Create Data
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil && data != nil {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    print(dict as Any)
                } catch {
                    print("data response error")
                }
                
            }
        }
        
        // Fire off data
        dataTask.resume()
    }
    
    func demoGetMethod() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
    
}


