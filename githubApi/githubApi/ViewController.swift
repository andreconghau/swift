//
//  ViewController.swift
//  githubApi
//
//  Created by andre on 10/13/20.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableUsers: UITableView!
    private let refreshControl = UIRefreshControl()
    var result:GitHubUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            self.tableUsers.refreshControl = refreshControl
        } else {
            self.tableUsers.addSubview(refreshControl)
        }
        // Setup Refresh Control
        self.refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        // Customizing Refresh Control
        self.refreshControl.tintColor = UIColor.blue
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Đang tải...", attributes: attributes)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        

        
        // Do any additional setup after loading the view.
        // self.alamofireRequest()
        self.tableUsers.dataSource = self
        
        self.alamofireRequestJson(textSearch: "andre") { (result, error) in
            // print(result,error)

            self.result = result as? GitHubUser
            self.tableUsers.reloadData()
        }
        
        // Search Topic with SwiftyJson
        self.jsonSwiftyJson()
        
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! UserTableViewCell
        cell.name.text = result?.items![indexPath.row].login
        cell.link.text = result?.items![indexPath.row].html_url
        cell.follower.text = "Follower: 0"
        cell.following.text = "Following: 0"
        
        let imgUrl = URL(string: (result?.items![indexPath.row].avatar_url)!)

        cell.avatar.boTronHinh()
        cell.avatar.image = UIImage(named: "non-avatar")
//        let queueLoadImg = DispatchQueue(label: "load_img")
//        queueLoadImg.async {
//            // DATA
//            do {
//                    let imgData = try Data(contentsOf: imgUrl!)
//                    // Render
//                DispatchQueue.main.async {
//                    cell.avatar.image = UIImage(data: imgData)
//                }
//
//            } catch {
//                // cell.avatar.image = UIImage(named: "non-avatar.png")
//            }
//        }
        
        // Apply KingFisher
        let resource = ImageResource(downloadURL: imgUrl!)
        let placeholder = UIImage(named: "non-avatar")
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        cell.avatar.kf.indicatorType = .activity
        cell.avatar.kf.setImage(with: resource, placeholder: placeholder, options: [.processor(processor)], progressBlock: { receivedSize, totalSize in
                                    let percentage = (Float(receivedSize) / Float(totalSize)) * 100.0
                                    print("downloading progress: \(percentage)%")
        }) { (result) in
            self.handle(result)
        }
        
        return cell
    }
    
    func handle(_ result: Result<RetrieveImageResult, KingfisherError>) {
        switch result {
        case .success(let retrieveImageResult):
            let image = retrieveImageResult.image
            let cacheType = retrieveImageResult.cacheType
            let source = retrieveImageResult.source
            let originalSource = retrieveImageResult.originalSource
            let message = """
                Image Size:
                \(image.size)

                Cache:
                \(cacheType)

                Source:
                \(source)

                Original source:
                \(originalSource)
            """
            // print(message)
        case.failure(let kingfisherError):
            print(kingfisherError)
        }
    }
    
    func alamofireRequest () {
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }
    
    func alamofireRequestJson (textSearch:String, completionHandler: @escaping (_ result: Any?, _ error: Any?) -> ()) {
        let user = "user"
        let password = "password"
        let credential = URLCredential(user: user, password: password, persistence: .forSession)

        AF.request("https://api.github.com/search/users?q=\(textSearch)")
            .authenticate(with: credential)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
            // debugPrint(response)
            switch response.result {
            case .failure(let error):
                print(error)
                completionHandler(nil,error)
            case .success:
                do {
                    let result = try JSONDecoder().decode(GitHubUser.self, from: response.data!)
                    print(result.total_count)
                    completionHandler(result, nil)
                } catch (let err) {
                    print(err.localizedDescription)
                    completionHandler(nil, err)
                }
                
            }
        }
    }

    @IBOutlet weak var input: UITextField!
    @IBAction func searchAction(_ sender: Any) {
        guard let text = input.text else {
            return
        }
        
        print(text)
        self.alamofireRequestJson(textSearch: text) { (result, error) in
            // print(result,error)
            if error != nil {
                let alert = UIAlertController(title: "Invalid Input", message: "Search rồi mà đéo có ^^", preferredStyle: .alert)
                    
                     let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                     })
                     alert.addAction(ok)
                     let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
                     })
                     alert.addAction(cancel)
                     DispatchQueue.main.async(execute: {
                        self.present(alert, animated: true)
                })
            }
            self.result = result as? GitHubUser
            self.tableUsers.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
            self.tableUsers.reloadData()
            
        }
        
    }
    
    @objc private func updateData() {
        var text:String = "andre"
        if (input.text != nil && input.hasText && input.text != "") {
            text = String(input.text!)
        }
        
        print(text)
        self.alamofireRequestJson(textSearch: text) { (result, error) in
            // print(result,error)
            if error != nil {
                let alert = UIAlertController(title: "Invalid Input", message: "Search rồi mà đéo có ^^", preferredStyle: .alert)
                    
                     let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                     })
                     alert.addAction(ok)
                     let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
                     })
                     alert.addAction(cancel)
                     DispatchQueue.main.async(execute: {
                        self.present(alert, animated: true)
                })
            }
            self.result = result as? GitHubUser
            self.tableUsers.reloadData()
        }
        self.refreshControl.endRefreshing()
    }
    
    func jsonSwiftyJson() {
        let user = "user"
        let password = "password"
        let credential = URLCredential(user: user, password: password, persistence: .forSession)

        AF.request("https://api.github.com/search/issues?q=windows+label:bug+language:python+state:open&sort=created&order=asc")
            .authenticate(with: credential)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
            // debugPrint(response)
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let jsonData = try JSON(data: data)
                    // print(jsonData)
                    let total_count = jsonData["total_count"].intValue
                    print("total_count: \(total_count)")
                    let user_1_login = jsonData["items"][0]["user"]["login"]
                    print(user_1_login)
                    for (key,subJson):(String, JSON) in jsonData["items"] {
                        print("#oder: \(key) - user: \(subJson["user"]["login"]) - avarta_url \(subJson["user"]["avatar_url"])")
                    }
                } catch (let errSwiftyJson) {
                    print(errSwiftyJson)
                }
                
            }
        }
    }
    
}

struct GitHubUser: Decodable {
    let total_count: Int?
    let incomplete_results:Bool?
    let items:[GitHubUserItem]?
}

struct GitHubUserItem: Decodable {
    let login: String?
    let id: Int
    let avatar_url: String?
    let html_url: String
}


