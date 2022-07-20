//
//  ClientAppointmentViewController.swift
//  fitcontact
//
//  Created by CSE on 20/07/2022.
//

import UIKit

class ClientAppointmentViewController: UIViewController {

    @IBOutlet weak var datePickedTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        
        datePicker.minimumDate = Date()
        
        datePickedTextField.inputView = datePicker
        datePickedTextField.text = dateFormatting(date: Date())
        
        // Do any additional setup after loading the view.
    }
    

    @objc func dateChanged(datePicker: UIDatePicker){
        datePickedTextField.text = dateFormatting(date: datePicker.date)
        
    }
    
    func dateFormatting(date: Date)-> String {
        let formatting = DateFormatter()
        formatting.dateFormat = "MMMM dd YYYY"
        return formatting.string(from: date)
        
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
