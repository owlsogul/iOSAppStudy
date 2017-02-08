//
//  LeapTests.swift
//  LeapTests
//
//  Created by Lingostar on 2015. 4. 11..
//  Copyright (c) 2015년 CodersHigh. All rights reserved.
//

import UIKit
import XCTest

//@testable import Leap

class LeapTests: XCTestCase {
    
    func testVanillaLeapYear() {
        let year = Year(calendarYear: 1996)
        XCTAssertTrue(year.isLeapYear())
    }
    
    func testAnyOldYear() {
        let year = Year(calendarYear: 1997)
        XCTAssertTrue(!year.isLeapYear())
    }
    
    func testCentury() {
        let year = Year(calendarYear: 1900)
        XCTAssertTrue(!year.isLeapYear())
    }
    
    func testExceptionalCentury() {
        let year = Year(calendarYear: 2400)
        XCTAssertTrue(year.isLeapYear())
    }
    
}
