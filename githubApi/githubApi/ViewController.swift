//
//  ViewController.swift
//  githubApi
//
//  Created by andre on 10/13/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableUsers: UITableView!
    
    var result:GitHubUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // self.alamofireRequest()
        self.tableUsers.dataSource = self
        
        self.alamofireRequestJson(textSearch: "andre") { (result, error) in
            // print(result,error)

            self.result = result as? GitHubUser
            self.tableUsers.reloadData()
        }
        
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
        let queueLoadImg = DispatchQueue(label: "load_img")
        cell.avatar.boTronHinh()
        cell.avatar.image = UIImage(named: "non-avatar")
        queueLoadImg.async {
            // DATA
            do {
                    let imgData = try Data(contentsOf: imgUrl!)
                    // Render
                DispatchQueue.main.async {
                    cell.avatar.image = UIImage(data: imgData)
                }
       
            } catch {
                // cell.avatar.image = UIImage(named: "non-avatar.png")
            }
            
        }
        
        return cell
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

        AF.request("http://api.github.com/search/users?q=\(textSearch)")
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
            self.tableUsers.reloadData()
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
