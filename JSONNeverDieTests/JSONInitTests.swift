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
    
    func testJSONInit() {
        let jsonFromArray: JSONND = ["love", "you", "guys"]
        let jsonFromDictionary: JSONND = ["love": ["you": "guys"]]
        
        XCTAssertEqual(jsonFromArray.RAWValue, "[\n  \"love\",\n  \"you\",\n  \"guys\"\n]")
        XCTAssertEqual(jsonFromDictionary.RAWValue, "{\n  \"love\" : {\n    \"you\" : \"guys\"\n  }\n}")
    }
    
    func testJSONInitError() {
        let json = JSONND.initWithData("haha".dataUsingEncoding(NSUTF8StringEncoding)!)
        XCTAssertNil(json.data)
    }
    
    func testSomething() {
        // here is something we need to do to increase coverage
    }

}