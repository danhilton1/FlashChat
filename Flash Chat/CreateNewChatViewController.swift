//
//  CreateNewChatViewController.swift
//  Flash Chat
//
//  Created by Daniel Hilton on 28/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import Firebase

class CreateNewChatViewController: UITableViewController {
    
    var userDatabaseArray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ChatHomeCell", bundle: nil), forCellReuseIdentifier: "chatHomeCell")

        
        fetchUsers()
        
        
    }
    
    func fetchUsers() {
        
        Database.database().reference().child("Users").observe(.childAdded) { (snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User()
                user.username = dictionary["User"] as? String
                self.userDatabaseArray.append(user.username!)
                //print(self.userDatabaseArray)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userDatabaseArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatHomeCell", for: indexPath) as! ChatHomeCell
        
        cell.chatButton.backgroundColor = UIColor.clear
        cell.chatButton.addTarget(self, action: #selector(CreateNewChatViewController.chatButtonPressed), for: .touchUpInside)
        cell.userLabel.text = userDatabaseArray[indexPath.row]
        tableView.rowHeight = 50
        
        
        return cell
        
    }
    
    @objc func chatButtonPressed() {
        
        self.performSegue(withIdentifier: "goToChat", sender: self)
        
    }

   

}
