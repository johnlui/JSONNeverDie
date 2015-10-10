//
//  BoolTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest

class BoolTests: BaseTests {

    func testBool() {
        XCTAssertEqual(self.json["hey"]["man"]["hello"].boolValue, true)
    }
    
    func testBoolNil() {
        XCTAssertEqual(self.json["hey_nil"]["man"]["hello"].boolValue, false)
    }
}