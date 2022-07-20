//
//  AddPackagesViewController.swift
//  fitcontact
//
//  Created by CSE on 20/07/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class AddPackagesViewController: UIViewController {

    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addPackageClicked(_ sender: Any) {
        let price = priceTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let number = numberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let type = typeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Database.database().reference().child("packages").childByAutoId().setValue(["price": price, "number": number, "type": type])
        
        
    }
    
}
