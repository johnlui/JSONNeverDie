//
//  JSONValueTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest
@testable import JSONNeverDie

class JSONValueTests: BaseTests {

    func testJSONValue1() {
        let jsonSon: JSONND = ["man": ["hello": true]]
        XCTAssertEqual(self.json["hey"].jsonStringValue, jsonSon.jsonStringValue)
    }
    
    func testJSONValue2() {
        let jsonSonSon: JSONND = ["hello": true]
        XCTAssertEqual(self.json["hey"]["man"].jsonStringValue, jsonSonSon.jsonStringValue)
    }
    
    func testJSONValueNil() {
        XCTAssertNil(self.json["hey_nil"].jsonString)
        XCTAssertNil(self.json["hey_nil"]["man"].jsonString)
        XCTAssertNil(self.json["hey"]["man_nil"].jsonString)
        
        XCTAssertEqual(self.json["hey_nil"].jsonStringValue, "")
        XCTAssertEqual(self.json["hey_nil"]["man"].jsonStringValue, "")
        XCTAssertEqual(self.json["hey"]["man_nil"].jsonStringValue, "")
    }
}