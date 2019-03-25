//
//  ChatHomeViewController.swift
//  Flash Chat
//
//  Created by Daniel Hilton on 17/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework
import SVProgressHUD

class ChatHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chatTableView: UITableView!
    
    let chatViewController = ChatViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
//        let chatCell = chatViewController.messageTableView.cellForRow(at: IndexPath(row: 1, section: 0))
//        
//        chatCell.
        
      
        
        
        chatTableView.register(UINib(nibName: "ChatHomeCell", bundle: nil), forCellReuseIdentifier: "chatHomeCell")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatHomeCell", for: indexPath) as! ChatHomeCell
        
//        cell.avatarImage.image = UIImage(named: "egg")
        //cell.avatarImage.backgroundColor = UIColor.flatWatermelon()
        cell.chatButton.addTarget(self, action: #selector(ChatHomeViewController.chatButtonPressed), for: .touchUpInside)
        
        chatTableView.rowHeight = 60
        
        let messageDB = Database.database().reference().child("Messages")
        
        messageDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            
            
            let sender = snapshotValue["Sender"]!
            
            if sender != Auth.auth().currentUser?.email {
                cell.chatLabel.text = "Chat with: \(sender)"
                
            } 
        }
        
        return cell
        
    }
    
    @objc func chatButtonPressed() {
     
        self.performSegue(withIdentifier: "goToChat", sender: self)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

  
    @IBAction func logOutPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
            
        }
        catch {
            print("There was an error signing out")
        }
        
        
    }
    
    
}
