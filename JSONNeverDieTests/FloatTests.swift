//
//  FloatTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest

class FloatTests: BaseTests {

    func testFloat() {
        XCTAssertNotNil(self.json["float"].float)
        XCTAssertEqual(self.json["float"].floatValue, 0.01)
    }
    
    func testFloatNil() {
        XCTAssertNil(self.json["float_nil"].float)
        XCTAssertEqual(self.json["float_nil"].floatValue, 0.0)
    }
}