//
//  Diary.swift
//  startRealm2
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import Foundation
import RealmSwift

class Diary: Object{
    
    dynamic var id = 0
    dynamic var data = Date()
    dynamic var text = ""
    var pictures = List<Picture>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}
