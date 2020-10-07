//
//  ImageViewController.swift
//  simple
//
//  Created by andre on 10/7/20.
//

import UIKit

class ImageViewController: UIViewController, UITableViewDataSource {
    
    var userData = ["Box Fan", "Ceiling Fan", "Desk Fan", "Fish Tank", "Floor Lamp", "Front Door","Box Fan", "Ceiling Fan", "Desk Fan",  "Garege Door", "Box Fan", "Ceiling Fan", "Desk Fan", "Lava Lamp", "Box Fan", "Ceiling Fan", "Desk Fan", "Fish Box"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! ListMemberTableViewCell

        cell.avatar.image = UIImage(named: "img1.jpg")
        cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width / 2
        cell.avatar.clipsToBounds = true
     
        cell.name.text = "andreconghau"
        cell.follower.text = "120 follower"
        return cell
    }

}
