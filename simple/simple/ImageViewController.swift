//
//  ImageViewController.swift
//  simple
//
//  Created by andre on 10/7/20.
//

import UIKit

class ImageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var userData:[User] = [
        User(name: "@bill", avatar: "https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.0-9/42141776_10212444418576743_5716158221761118208_o.jpg?_nc_cat=103&_nc_sid=09cbfe&_nc_ohc=2vCzBbKsva0AX9IUCf2&_nc_ht=scontent.fsgn5-7.fna&oh=0b370a7db733515f0fcc7c143aa49d86&oe=5FA17047", follower: 100),
        User(name: "@nelson", avatar: "https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.0-9/82773546_3137024372975538_1105451378567806976_n.jpg?_nc_cat=100&_nc_sid=09cbfe&_nc_ohc=sHayWdG8pc8AX-_p4PM&_nc_ht=scontent.fsgn5-5.fna&oh=188bb0a23d1b0b7ff19d2f858b35af4f&oe=5FA25580", follower: 150),
        User(name: "@thomas", avatar: "thomas", follower: 1000),
        User(name: "@hector", avatar: "https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.0-1/p480x480/90094139_10158067996758560_681490702898561024_n.jpg?_nc_cat=103&_nc_sid=7206a8&_nc_ohc=ODT9_ySh4LEAX-lEAPh&_nc_ht=scontent.fsgn5-7.fna&tp=6&oh=be710694fbf1e95bd637d630b7e3c091&oe=5FA44BF8", follower: 10),
        User(name: "@andre", avatar: "https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.0-1/s480x480/88240659_118340473079218_8748199292134490112_n.jpg?_nc_cat=109&_nc_sid=7206a8&_nc_ohc=q0UucWuUAhsAX8WVTC6&_nc_ht=scontent.fsgn5-6.fna&tp=7&oh=bca29268b5cbdf4b88ec594e949699b9&oe=5FA4B7EE", follower: 6969),
        User(name: "@andy", avatar: "https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.0-9/62416323_2656521304362736_9173654478983790592_n.jpg?_nc_cat=110&_nc_sid=09cbfe&_nc_ohc=7idKYQaOVjcAX-_P4YA&_nc_ht=scontent.fsgn5-3.fna&oh=5a305e3ed17a077da8a953e6e9a89c24&oe=5FA2F500", follower: 7979797),
        User(name: "@henry", avatar: "https://scontent.fsgn5-1.fna.fbcdn.net/v/t1.0-9/120089263_4398080580265507_4892597880209550103_n.jpg?_nc_cat=101&_nc_sid=09cbfe&_nc_ohc=dYc2nK8kIZ0AX-_Vv_L&_nc_ht=scontent.fsgn5-1.fna&oh=507b0deab2235045ae8fb0afb047b434&oe=5FA2EFCD", follower: 15),
        User(name: "@dom", avatar: "https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.0-1/p480x480/86500780_2763447290407865_5093193251498754048_n.jpg?_nc_cat=105&_nc_sid=7206a8&_nc_ohc=e3xV2iJaocEAX8TPFwg&_nc_ht=scontent.fsgn5-2.fna&tp=6&oh=fd587dfc7094f2a27da9d2514436a2e5&oe=5FA1EA14", follower: 89),
        User(name: "@steve", avatar: "https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.0-1/p480x480/50096394_1305061759667121_4119677908144881664_o.jpg?_nc_cat=106&_nc_sid=7206a8&_nc_ohc=69h-st1_3bMAX8nhg2u&_nc_oc=AQli0x5Q9WYSEjeeuXL_4hzln7_3sl5-H7XjmifW54x_NVEVZkOSJte22GcZ4i6Hlwc&_nc_ht=scontent.fsgn5-6.fna&tp=6&oh=1306118518f96a2d9f9c667119a424ae&oe=5FA42B74", follower: 111),
        User(name: "@matthew", avatar: "https://scontent.fsgn5-1.fna.fbcdn.net/v/t31.0-1/p480x480/11149691_876892532383864_757749163287773671_o.jpg?_nc_cat=107&_nc_sid=7206a8&_nc_ohc=W_4GNNQz-rMAX_y1M1p&_nc_ht=scontent.fsgn5-1.fna&tp=6&oh=693671c58f104c09758522a2c4c63ff2&oe=5FA0F28C", follower: 2111),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! ListMemberTableViewCell
        
        let imgUrl = URL(string: userData[indexPath.row].avatar)
        let queueLoadImg = DispatchQueue(label: "load_img")
        cell.avatar.image = UIImage(named: "non-avatar.png")
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
        cell.avatar.boTronHinh()
     
        cell.name.text = userData[indexPath.row].name
        cell.follower.text = "follower: " + String(userData[indexPath.row].follower)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userInfo:User = userData[indexPath.row]
        // print(indexPath.row)
        // StoryBoard.
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        // Tao ViewController Sence
        let userProfileSence = mainSB.instantiateViewController(identifier: "UserProfileView") as! UserProfileViewController
        userProfileSence.userInfo = userInfo
        self.navigationController?.pushViewController(userProfileSence, animated: true)
        
    }

}
