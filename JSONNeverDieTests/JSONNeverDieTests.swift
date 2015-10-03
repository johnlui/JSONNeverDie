//
//  JSONNeverDieTests.swift
//  JSONNeverDieTests
//
//  Created by 吕文翰 on 15/9/27.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest
import JSONNeverDie

class JSONNeverDieTests: XCTestCase {
    
    var json: JSONND!
    
    override func setUp() {
        super.setUp()
        
        if let file = NSBundle(forClass:JSONNeverDieTests.self).pathForResource("test", ofType: "json") {
            if let data = NSData(contentsOfFile: file) {
                self.json = JSONND.initWithData(data)
            } else {
                XCTFail("NSData from test JSON file is nil!")
            }
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseJSON() {
        XCTAssertNotNil(self.json.data, "JSONND.jsonObject should not be nil!")
    }
    func testString() {
        XCTAssertNotNil(self.json["string"].string)
        XCTAssertEqual(self.json["string"].stringValue, "🐳")
    }
    func testInt() {
        XCTAssertNotNil(self.json["int"].int)
        XCTAssertEqual(self.json["int"].intValue, 10086)
    }
    func testFloat() {
        XCTAssertNotNil(self.json["float"].float)
        XCTAssertEqual(self.json["float"].floatValue, 0.01)
    }
    func testBool() {
        XCTAssertEqual(self.json["hey"]["man"]["hello"].boolValue, true)
    }
    
    func testJSONValue() {
        let jsonSon: JSONND = ["man": ["hello": true]]
        let jsonSonSon: JSONND = ["hello": true]
        XCTAssertEqual(self.json["hey"].jsonStringValue, jsonSon.jsonStringValue)
        XCTAssertEqual(self.json["hey"]["man"].jsonStringValue, jsonSonSon.jsonStringValue)
    }
    
    func testArrayWithObjects() {
        let array = self.json["array"].arrayValue
        XCTAssertEqual(array[0]["key"].intValue, 10010)
        XCTAssertEqual(array[1]["key"].stringValue, "🐶")
        XCTAssertEqual(array[2]["key"].floatValue, 0.02)
    }
    func testArrayWithValues() {
        let array = self.json["array_values"].arrayValue
        XCTAssertEqual(array[0].intValue, 10000)
        XCTAssertEqual(array[1].stringValue, "🙈")
        XCTAssertEqual(array[2].floatValue, 0.03)
    }
    
    func testJSONInit() {
        let jsonFromArray: JSONND = ["love", "you", "guys"]
        let jsonFromDictionary: JSONND = ["love": ["you": "guys"]]
        
        XCTAssertEqual(jsonFromArray.jsonStringValue, "[\n  \"love\",\n  \"you\",\n  \"guys\"\n]")
        XCTAssertEqual(jsonFromDictionary.jsonStringValue, "{\n  \"love\" : {\n    \"you\" : \"guys\"\n  }\n}")
    }
    
}
