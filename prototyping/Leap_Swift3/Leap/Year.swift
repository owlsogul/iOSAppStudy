//
//  Year.swift
//  Leap
//
//  Created by CAUADC on 2017. 1. 20..
//  Copyright © 2017년 CodersHigh. All rights reserved.
//

import Foundation

struct Year {
    var calendarYear:Int
    
    func isLeapYear() -> Bool {
        return calendarYear % 4 == 0 && (calendarYear % 100 != 0 || calendarYear % 400 == 0)
        
    }
}
