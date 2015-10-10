//
//  IntTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest

class IntTests: BaseTests {

    func testInt() {
        XCTAssertNotNil(self.json["int"].int)
        XCTAssertEqual(self.json["int"].intValue, 10086)
    }
    
    func testIntNil() {
        XCTAssertNil(self.json["int_nil"].int)
        XCTAssertEqual(self.json["int_nil"].intValue, 0)
    }
}