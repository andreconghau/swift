//
//  ViewController.swift
//  realmdata
//
//  Created by andre on 10/19/20.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var books: Results<BookItem>?
    @IBOutlet weak var listBook: UITableView!
    
    @IBOutlet weak var titleInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        books = BookItem.getAll()
        listBook.dataSource = self
        listBook.delegate = self
    }

    @IBAction func addItemAction(_ sender: Any) {
        guard let title = titleInput.text else {
            return
        }
        
        if title == "" {
            return
        }
        
        let item = BookItem.add(name: title)
        titleInput.text = ""
        print(item)
        listBook.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? BookTableViewCell
        cell?.titleItem.text = self.books?[indexPath.row].name
        
        return cell!
        
    }
    
    
    /*
     SWIPE to Action
     */
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    // Right Swipe
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal,
                                        title: "Favourite") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsFavourite()
                                            completionHandler(true)
        }
        action.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Archive action
        let archive = UIContextualAction(style: .normal,
                                         title: "Archive") { [weak self] (action, view, completionHandler) in
                                            self?.handleMoveToArchive()
                                            completionHandler(true)
        }
        archive.backgroundColor = .systemGreen

        // Trash action
        let trash = UIContextualAction(style: .destructive,
                                       title: "Trash") { [weak self] (action, view, completionHandler) in
            self?.handleMoveToTrash(book: (self?.books![indexPath.row]) as! BookItem)
                                        completionHandler(true)
        }
        trash.backgroundColor = .systemRed

        // Unread action
        let unread = UIContextualAction(style: .normal,
                                       title: "Mark as Unread") { [weak self] (action, view, completionHandler) in
                                        self?.handleMarkAsUnread()
                                        completionHandler(true)
        }
        unread.backgroundColor = .systemOrange

        let configuration = UISwipeActionsConfiguration(actions: [trash, archive, unread])
        // If you do not want an action to run with a full swipe
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
    
    private func handleMarkAsFavourite() {
        print("Marked as favourite")
    }

    private func handleMarkAsUnread() {
        print("Marked as unread")
    }

    private func handleMoveToTrash(book: BookItem) {
        print("Moved to trash")
        print(book)
        let alert = UIAlertController(title: "Hi!", message: "Bạn có muốn xóa \(book.name)", preferredStyle: .alert)
            
             let ok = UIAlertAction(title: "Xóa", style: .default, handler: { action in
                book.delete()
                self.listBook.reloadData()
             })
             alert.addAction(ok)
             let cancel = UIAlertAction(title: "Hủy", style: .default, handler: { action in
             })
             alert.addAction(cancel)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
        })
        
    }

    private func handleMoveToArchive() {
        print("Moved to archive")
    }
    
}

