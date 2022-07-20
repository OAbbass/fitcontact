//
//  ViewController.swift
//  fitcontact
//
//  Created by CSE on 18/07/2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginClicked(_ sender: Any) {
        
        let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("error")
                return
            }
           
            self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            //self.loginToMainPage()
        }
    }
    
//    func loginToMainPage(){
//        let mainPageVC = storyboard?.instantiateViewController(withIdentifier: "MainPage")
//
//        view.window?.rootViewController = mainPageVC
//        view.window?.makeKeyAndVisible()
//    }
}

