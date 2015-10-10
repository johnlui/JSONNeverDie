//
//  StringTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest

class StringTests: BaseTests {

    func testString() {
        XCTAssertNotNil(self.json["string"].string)
        XCTAssertEqual(self.json["string"].stringValue, "🐳")
    }
    
    func testStringNil() {
        XCTAssertNil(self.json["string_nil"].string)
        XCTAssertEqual(self.json["string_nil"].stringValue, "")
    }
}
