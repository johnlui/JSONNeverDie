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
    
    var JSONData: NSData!
    
    override func setUp() {
        super.setUp()
        
        if let file = NSBundle(forClass:JSONNeverDieTests.self).pathForResource("test", ofType: "json") {
            self.JSONData = NSData(contentsOfFile: file)
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseJSON() {
        let json = JSONND.initWithData(self.JSONData)
        XCTAssertNotNil(json.jsonObject, "JSONND.jsonObject should not be nil!")
    }
    func testString() {
        let json = JSONND.initWithData(self.JSONData)
        XCTAssertNotNil(json["string"].string)
        XCTAssertEqual(json["string"].stringValue, "🐳")
    }
    func testInt() {
        let json = JSONND.initWithData(self.JSONData)
        XCTAssertNotNil(json["int"].int)
        XCTAssertEqual(json["int"].intValue, 10086)
    }
    func testFloat() {
        let json = JSONND.initWithData(self.JSONData)
        XCTAssertNotNil(json["float"].float)
        XCTAssertEqual(json["float"].floatValue, 0.01)
    }
    func testBool() {
        let json = JSONND.initWithData(self.JSONData)
        XCTAssertEqual(json["hey"]["man"]["hello"].boolValue, true)
    }
    
    func testJSONValue() {
        let json = JSONND.initWithData(self.JSONData)
        let jsonSon: JSONND = ["man": ["hello": true]]
        let jsonSonSon: JSONND = ["hello": true]
        XCTAssertEqual(json["hey"].jsonStringValue, jsonSon.jsonStringValue)
        XCTAssertEqual(json["hey"]["man"].jsonStringValue, jsonSonSon.jsonStringValue)
    }
    
    func testArrayWithObjects() {
        let json = JSONND.initWithData(self.JSONData)
        let array = json["array"].arrayValue
        XCTAssertEqual(array[0]["key"].intValue, 10010)
        XCTAssertEqual(array[1]["key"].stringValue, "🐶")
        XCTAssertEqual(array[2]["key"].floatValue, 0.02)
    }
    func testArrayWithValues() {
        let json = JSONND.initWithData(self.JSONData)
        let array = json["arrya_values"].arrayValue
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
