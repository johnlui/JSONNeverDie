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
        XCTAssertEqual(self.json["hey"].RAWValue, jsonSon.RAWValue)
    }
    
    func testJSONValue2() {
        let jsonSonSon: JSONND = ["hello": true]
        XCTAssertEqual(self.json["hey"]["man"].RAWValue, jsonSonSon.RAWValue)
    }
    
    func testJSONValueNil() {
        XCTAssertNil(self.json["hey_nil"].RAW)
        XCTAssertNil(self.json["hey_nil"]["man"].RAW)
        XCTAssertNil(self.json["hey"]["man_nil"].RAW)
        
        XCTAssertEqual(self.json["hey_nil"].RAWValue, "")
        XCTAssertEqual(self.json["hey_nil"]["man"].RAWValue, "")
        XCTAssertEqual(self.json["hey"]["man_nil"].RAWValue, "")
    }
}
