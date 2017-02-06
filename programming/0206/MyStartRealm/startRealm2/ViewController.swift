//
//  ViewController.swift
//  startRealm2
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addDiary()
        readDiary()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addDiary(){
        
        let realm = try! Realm()
        
        let testPicture1 = Picture(value:["01.jpg"])
        let testPicture2 = Picture(value:["02.jpg"])
        
        let myDiary = Diary(value: [incrementID(), Date(), "안녕하세요", [testPicture1, testPicture2]])
        
        try! realm.write {
            realm.add(myDiary)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    func incrementID() -> Int{
        let realm = try! Realm()
        return (realm.objects(Diary.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }

    func readDiary(){
        
        let realm = try! Realm()
        
        let diaries = realm.objects(Diary.self)
        
        for diary in diaries {
            var text = diary.text
            for picture in diary.pictures{
                text.append("."+picture.url)
            }
            print(text)
        }
        
    }
    
    
}

