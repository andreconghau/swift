//
//  ViewController.swift
//  checkinternet
//
//  Created by andre on 10/15/20.
//

import UIKit
import Reachability

class ViewController: UIViewController {
    @IBOutlet weak var statusText: UILabel!
    let reachability = try! Reachability()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //declare this property where it won't go out of scope relative to your listener
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                DispatchQueue.main.async {
                    self.statusText.text = "Reachable via WiFi"
                }

            } else {
                print("Reachable via Cellular")
                DispatchQueue.main.async {
                    self.statusText.text = "Reachable via Cellular"
                }
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            DispatchQueue.main.async {
                self.statusText.text = "Not reachable"
            }
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
            DispatchQueue.main.async {
                self.statusText.text = "Unable to start notifier"
            }
        }
        
    }


}

