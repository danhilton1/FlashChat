//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(userDatabaseArray)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        
        SVProgressHUD.show()
        
        //TODO: Set up a new user on our Firbase database
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            }
            else {
                print("Registration Successful")
                
                SVProgressHUD.dismiss()
                
                let userDatabase = Database.database().reference().child("Users")
                let userDictionary = ["User": Auth.auth().currentUser?.email, "ID": Auth.auth().currentUser?.uid]
                //self.userDatabaseArray.append((Auth.auth().currentUser?.email!)!)
                
                userDatabase.childByAutoId().setValue(userDictionary) {
                    (error, reference) in
                    if error != nil {
                        print(error!)
                    } else {
                        
                    }
                }
                self.performSegue(withIdentifier: "goToChatHome", sender: self)
            }
        }

        
        
    } 
    
    
}
