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
        
        


        // demoGetMethod()
        
        // demoDecodableSingle()
        
        demoApiMultiRecords()
        
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
            guard let data = data, error == nil else {
                print("Something wrong \(error!.localizedDescription)")
                return
            }
            // print(String(data: data, encoding: .utf8)!)

            do {
                let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                // print(result!)
                for item in result! {
                    // print(item)
                    print("ID: \(item["id"]) - Title: \(item["title"])")
                    if let names = item["body"] as? [String] {
                                // print(names)
                            }
                }
                
            } catch {
                print("faild to convert: \(error.localizedDescription)")
            }

            
        }
        task.resume()
    }
    
    func demoDecodableSingle () {
        // Simple API: https://api.letsbuildthatapp.com/jsondecodable/course
        let json_url_string = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: json_url_string) else {
            return
        }
        
        // Step1: build sample struct
        // let my_course = Course(id: 1, name: "My course", link: "some link", image_url: "img url")
        // print(my_course)
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // check err
            // check response header is 200
            
            print("do something")
            guard let data = data else { return }
            // let data_string = String(data: data, encoding: .utf8)
            
            // Method 1: dung cach nay co the define lay key Json data return
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    return
                }
                let course = Course(json: json)
                
                print("Method1: id:\(course.id), name:\(course.name)")
                
            } catch let jsonErr {
                print("Some thing wrong at: \(jsonErr.localizedDescription)")
            }
             
            
            // Method 2: su dung Decoable, tu dong mapping field api
            do {
                let course = try JSONDecoder().decode(CourseDecoable.self, from: data)
                print("Method1: id:\(course.id), name:\(course.name)")
                
            } catch let jsonErr {
                print("Some thing wrong at: \(jsonErr)")
            }
            
        }.resume()
        
    }
    
    public var result: [CourseDecoable]?
    
    func demoApiMultiRecords() {
        let api_url_string = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        print("API Endpoint: \(api_url_string)")
        guard let api_url = URL(string: api_url_string) else {
            return
        }
        
        URLSession.shared.dataTask(with: api_url) { (data, response, err) in
            guard let data = data else { return }
            //let data_string = String(data: data, encoding: .utf8)
            // print(data_string)
            // Method 2: su dung Decoable, tu dong mapping field api
            do {
                let courses = try JSONDecoder().decode([CourseDecoable].self, from: data)
                // print(courses)
                for item in courses {
                    print("id: \(item.id) - name:\(item.name)")
                }
                
            } catch let jsonErr {
                print("Some thing wrong at: \(jsonErr)")
            }
            
        }.resume()
    }
    
    
    
}


// Ten key mapping ko can giong voi key tu api tra ve
struct Course {
    let id: Int
    let name: String
    let link: String
    let image_url: String
    
    init(json:[String: Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        image_url = json["image_url"] as? String ?? ""
    }
}

// Ten key mapping phai giong voi key tu api tra ve
struct CourseDecoable: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
}

