//
//  GreenViewController.swift
//  slideMenu
//
//  Created by andre on 10/12/20.
//

import UIKit
import RxCocoa
import RxSwift

class GreenViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "USERS") as! UsersCell
        cell.name.text = "name"
        cell.id.text = "id"
        return cell
    }
    
    @IBAction func input_text(_ sender: Any) {
    }
    @IBOutlet weak var table_view: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_view.dataSource = self
        print("Demo MVVM")
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
