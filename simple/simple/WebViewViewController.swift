//
//  WebViewViewController.swift
//  simple
//
//  Created by andre on 10/7/20.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlWebview:URL = URL(string: "https://webview.vn.revu.net/posts")!
        let req = URLRequest(url: urlWebview)
        webView.load(req)
        
        // after done with setup the `webView`:
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadWebView(_:)), for: .valueChanged)
        webView.scrollView.addSubview(refreshControl)
    }
    
    @objc func reloadWebView(_ sender: UIRefreshControl) {
        webView.reload()
        sender.endRefreshing()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
