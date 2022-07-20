//
//  ScheduleAppointmentViewController.swift
//  fitcontact
//
//  Created by CSE on 19/07/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class ScheduleAppointmentViewController: UIViewController {

    @IBOutlet weak var MakeSessionButton: UIButton!
    @IBOutlet weak var TrainerTextField: UITextField!
    @IBOutlet weak var SessionTypeTextField: UITextField!
    @IBOutlet weak var TimeTextField: UITextField!
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

    @IBAction func makeSessionClicked(_ sender: Any) {
            
        let date = datePickedTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let time = TimeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let type = SessionTypeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let trainer = TrainerTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Database.database().reference().child("sessions").childByAutoId().setValue(["date": date, "time": time, "type": type, "trainer": trainer])
        
            }
        
    }
    
    

