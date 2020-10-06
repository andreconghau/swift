//
//  ListViewController.swift
//  simple
//
//  Created by andre on 10/6/20.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource  {


    @IBOutlet weak var myTable2: UITableView!
    @IBOutlet weak var myTable: UITableView!
    var listMember:[String]!
    var listTech:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listMember = ["Bill", "Nelson", "Andre", "Thosmas", "Hector", "Jason", "Henrry", "Matthew", "Andy", "Dom", "Terry", "Kai", "Jacky"]
        self.listTech = ["Java", "PHP", "iOS", "Android"]
        
        self.myTable.dataSource = self
        self.myTable2.dataSource = self

    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return self.listMember.count
        }
        if tableView.tag == 1 {
            return self.listTech.count
        }
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        if tableView.tag == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "ITEMS")
            cell?.textLabel?.text = self.listMember[indexPath.row]
            cell?.detailTextLabel?.text = "detail"
        }
        
        if tableView.tag == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "TECHS")
            cell?.textLabel?.text = self.listTech[indexPath.row]
            cell?.detailTextLabel?.text = "view"
        }
        
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 0 {
            return 4
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.tag == 0 {
            return "Setting of section " + String(section)
        }
        return nil
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
