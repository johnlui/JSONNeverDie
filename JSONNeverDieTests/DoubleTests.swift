//
//  DoubleTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 16/7/11.
//  Copyright © 2016年 JohnLui. All rights reserved.
//

import XCTest

class DoubleTests: BaseTests {
    
    func testDouble() {
        XCTAssertNotNil(self.json["double"].double)
        XCTAssertEqual(self.json["double"].doubleValue, 0.01)
    }
    
    func testDoubleNil() {
        XCTAssertNil(self.json["double_nil"].double)
        XCTAssertEqual(self.json["double_nil"].doubleValue, 0.0)
    }
}