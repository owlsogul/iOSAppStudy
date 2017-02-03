//
//  ViewController.swift
//  SaveAndLoad
//
//  Created by CAUADC on 2017. 2. 3..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var majorField: UITextField!
    
    let userDefaultsName = "userName"
    let userDefaultsAge = "userAge"
    let userDefaultsMajor = "userMajor"
    
    @IBAction func clikcSaveButton(_ sender: UIButton){
        
        let name: String? = self.nameField.text
        let age: String? = self.ageField.text
        let major: String? = self.majorField.text
        
        print("name: \(name). age: \(age). major: \(major)");
        
        let 사용자기본저장소 = UserDefaults.standard
        사용자기본저장소.set(name, forKey: userDefaultsName)
        사용자기본저장소.set(age, forKey: userDefaultsAge)
        사용자기본저장소.set(major, forKey: userDefaultsMajor)
        사용자기본저장소.synchronize()
        
    }

    @IBAction func clikcLoadButton(_ sender: UIButton){
        
        let 사용자기본저장소 = UserDefaults.standard
        let name: String? = 사용자기본저장소.string(forKey: userDefaultsName)
        let age: String? = 사용자기본저장소.string(forKey: userDefaultsAge)
        let major: String? = 사용자기본저장소.string(forKey: userDefaultsMajor)
        
        print("name: \(name). age: \(age). major: \(major)");
        
        nameField.text = name;
        ageField.text = age;
        majorField.text = major;
        
    }
    
}

