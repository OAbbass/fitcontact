//
//  YourProfileViewController.swift
//  fitcontact
//
//  Created by CSE on 18/07/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class YourProfileViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("error")
            return
        }
        
        Database.database().reference().child("users").child(uid).observe(.value, with: { [self](snapshot) in if let dictionary = snapshot.value as? [String: Any]{
            let firstName =  dictionary["firstname"] as! String
            let lastName = dictionary["lastname"] as! String
            let age = dictionary["age"] as! String
            let gender = dictionary["gender"] as! String
            let type = dictionary["type"] as! String
            
            self.firstNameLabel.text = "First Name: \(firstName)"
            self.lastNameLabel.text = "Last Name: \(lastName)"
            self.ageLabel.text = "Age: \(age)"
            self.genderLabel.text = "Gender: \(gender)"
            self.typeLabel.text = "Type: \(type)"
            
            
        }
            
        })
        
        
        
        
        
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
