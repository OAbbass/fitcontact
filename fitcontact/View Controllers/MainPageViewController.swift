//
//  MainPageViewController.swift
//  fitcontact
//
//  Created by CSE on 18/07/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class MainPageViewController: UIViewController {

    var type: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("error")
            return
        }
        
        Database.database().reference().child("users").child(uid).observe(.value, with: { [self](snapshot) in if let dictionary = snapshot.value as? [String: Any]{
//            let firstName =  dictionary["firstname"] as! String
//            let lastName = dictionary["lastname"] as! String
//            let age = dictionary["age"] as! String
//            let gender = dictionary["gender"] as! String
            type = dictionary["type"] as! String
            

            
            
        }
            
        })
        // Do any additional setup after loading the view.
    }
    
    @IBAction func packagesButtonClicked(_ sender: Any) {
        if type == "Trainer"{
        self.performSegue(withIdentifier: "trainerPackagesSegue", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "clientPackagesSegue", sender: nil)
        }
    }
    @IBAction func logoutClicked(_ sender: Any) {
        
    }
    
   
    @IBAction func appointmentButtonClicked(_ sender: Any) {
        
        if type == "Trainer"{
        self.performSegue(withIdentifier: "trainerSegue", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "clientSegue", sender: nil)
        }
        
        }
    }
    

