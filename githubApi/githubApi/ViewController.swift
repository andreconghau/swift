//
//  ViewController.swift
//  githubApi
//
//  Created by andre on 10/13/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // self.alamofireRequest()
        
        self.alamofireRequestJson()
        
    }
    
    func alamofireRequest () {
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }
    
    func alamofireRequestJson () {
        let user = "user"
        let password = "password"
        let credential = URLCredential(user: user, password: password, persistence: .forSession)

        AF.request("https://api.github.com/search/users?q=andre")
            .authenticate(with: credential)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
            // debugPrint(response)
            switch response.result {
            case .failure(let error):
                print(error)
            case .success:
                do {
                    let result = try JSONDecoder().decode(GitHubUser.self, from: response.data!)
                    print(result.total_count)
                } catch (let err) {
                    print(err.localizedDescription)
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
