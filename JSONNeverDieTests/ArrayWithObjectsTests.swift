//
//  ArrayWithObjectsTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest
@testable import JSONNeverDie

class ArrayWithObjectsTests: BaseTests {
    
    var array: [JSONND]!
    
    override func setUp() {
        super.setUp()
        
        self.array = self.json["array"].arrayValue
    }
    
    func testArrayWithObjects() {
        XCTAssertEqual(self.array[0]["key"].int, 10010)
        XCTAssertEqual(self.array[1]["key"].stringValue, "🐶")
        XCTAssertEqual(self.array[2]["key"].doubleValue, 0.02)
    }
    
    func testArrayWithObjectsNil() {
        XCTAssertNil(self.array[0]["key_nil"].int)
        XCTAssertNil(self.array[1]["key_nil"].string)
        XCTAssertNil(self.array[2]["key_nil"].double)
        
        XCTAssertEqual(self.array[0]["key_nil"].intValue, 0)
        XCTAssertEqual(self.array[1]["key_nil"].stringValue, "")
        XCTAssertEqual(self.array[2]["key_nil"].doubleValue, 0.0)
    }
}
