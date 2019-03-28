//
//  CreateNewChatViewController.swift
//  Flash Chat
//
//  Created by Daniel Hilton on 28/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class CreateNewChatViewController: UITableViewController {
    
    let chatHomeViewController = ChatHomeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
