//
//  JSONInitTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest
@testable import JSONNeverDie

class JSONInitTests: BaseTests {
    
    func testJSONInitByLiteral() {
        let jsonFromArray: JSONND = ["love", "you", "guys"]
        let jsonFromDictionary: JSONND = ["love": ["you": "guys"]]
        
        XCTAssertEqual(jsonFromArray.RAWValue, "[\n  \"love\",\n  \"you\",\n  \"guys\"\n]")
        XCTAssertEqual(jsonFromDictionary.RAWValue, "{\n  \"love\" : {\n    \"you\" : \"guys\"\n  }\n}")
    }
    
    func testJSONInitByParam() {
        let jsonFromArray = JSONND(array: ["love", "you", "guys"])
        let jsonFromDictionary = JSONND(dictionary: ["love": ["you": "guys"]])
        
        XCTAssertEqual(jsonFromArray.RAWValue, "[\n  \"love\",\n  \"you\",\n  \"guys\"\n]")
        XCTAssertEqual(jsonFromDictionary.RAWValue, "{\n  \"love\" : {\n    \"you\" : \"guys\"\n  }\n}")
    }
    
    func testJSONInitError() {
        let json = JSONND(string: "haha")
        XCTAssertNil(json.data)
        
        XCTAssertNil(json.RAW)
        XCTAssertEqual(json.RAWValue, "")
    }
    
    func testJSONInitNil() {
        let json = JSONND()
        XCTAssertNil(json.data)
        
        XCTAssertNil(json.RAW)
        XCTAssertEqual(json.RAWValue, "")
    }
    
    func testSomething() {
        // here is something we need to do to increase coverage
    }

}
