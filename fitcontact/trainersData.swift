//
//  trainersData.swift
//  fitcontact
//
//  Created by CSE on 19/07/2022.
//

import Foundation
import UIKit
import Firebase

class trainersData{
    
    let ref: DatabaseReference?
    
    let firstName: String
    let lastName: String
    let age: String
    let gender: String
    let type: String
    
    init(firstName: String, lastName: String, age: String, gender:String, type: String){
        self.ref = nil
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
        self.type = type
    }
    
    init?(snapshot:DataSnapshot){
        guard
            let value = snapshot.value as? [String: AnyObject],
            let firstname = value["firstname"] as? String,
            let lastname = value["lastname"] as? String,
            let age = value["age"] as? String,
            let gender = value["gender"] as? String,
                let type = value["type"] as? String
        else
            {
                return nil
            }
        self.ref = snapshot.ref
        self.firstName = firstname
        self.lastName = lastname
        self.age = age
        self.gender = gender
        self.type = type
        
    }
    func toAnyObject()->Any {
        return [
            "firstname": firstName,
            "lastname": lastName,
            "age": age,
            "gender": gender,
            "type": type
        ]
    }
}
