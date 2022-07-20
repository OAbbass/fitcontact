//
//  SignUpViewController.swift
//  fitcontact
//
//  Created by CSE on 18/07/2022.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var type: UITextField!
    let types = ["Trainer", "Client"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        type.inputView = pickerView
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
    
    func validateFields()-> String? {
        
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || age.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || age.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || gender.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "error"
        }
        
        //password check
        return nil
    }
    @IBAction func signUpClicked(_ sender: Any) {
       
        
        if validateFields() == nil {
            let firstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let age = age.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let gender = gender.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let type = type.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error != nil{
                    print("error")
                    return
                }
                
                let uid = Auth.auth().currentUser?.uid
                Database.database().reference().child("users").child(uid!).setValue(["firstname": firstName, "lastname": lastName, "age": age, "type": type,"gender": gender])
                    self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
                }
            }
        }
        
    
//    func loginToMainPage(){
//        let mainPageVC = storyboard?.instantiateViewController(withIdentifier: "MainPage")
//
//        view.window?.rootViewController = mainPageVC
//        view.window?.makeKeyAndVisible()
//    }
}


extension SignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        types.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        type.text = types[row]
        type.resignFirstResponder()
    }
}
