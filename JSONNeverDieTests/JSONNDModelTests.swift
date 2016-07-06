//
//  JSONNDModelTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/3.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest
import JSONNeverDie

class JSONNDModelTests: BaseTests {
    
    var testModel: TestModel!
    var man: Man!
    
    override func setUp() {
        super.setUp()
        
        self.testModel = TestModel(JSONNDObject: self.json["test_model"])
        XCTAssertNotNil(self.testModel, "testModel should not be nil!")
        
        self.man = Man()
        XCTAssertEqual(self.man.hello, false, "JSONNDModel init with nothing whould gather init values")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testModelString() {
        XCTAssertNotNil(self.testModel.string)
        XCTAssertEqual(self.testModel.string, "🐳")
    }
    func testModelInt() {
        XCTAssertNotNil(self.testModel.int)
        XCTAssertEqual(self.testModel.int, 10086)
    }
    func testModelFloat() {
        XCTAssertNotNil(self.testModel.float)
        XCTAssertEqual(self.testModel.float, 0.01)
    }
    func testModelBool() {
        XCTAssertEqual(self.testModel.hey.man.hello.boolValue, true)
    }
    
    func testModelJSONStringValue() {
        let jsonSon: JSONND = ["man": ["hello": true]]
        let jsonSonSon: JSONND = ["hello": true]
        XCTAssertEqual(self.testModel.hey.RAWValue, jsonSon.RAWValue)
        XCTAssertEqual(self.testModel.hey.man.RAWValue, jsonSonSon.RAWValue)
    }
    
    func testModelJSONStringValueNil() {
        class Model: JSONNDModel {}
        let model = Model(JSONNDObject: JSONND.initWithData(NSData()))
        
        XCTAssertNil(model.RAW)
        XCTAssertEqual(model.RAWValue, "")
    }
    
    func testModelArrayWithObjects() {
        print(self.testModel)
        XCTAssertEqual(self.testModel.array[0].key, 10000)
        XCTAssertEqual(self.testModel.array[1].key, 10001)
        XCTAssertEqual(self.testModel.array[2].key, 10002)
    }
    func testModelArrayWithValues() {
        XCTAssertEqual(self.testModel.array_values[0], 20000)
        XCTAssertEqual(self.testModel.array_values[1], 20001)
        XCTAssertEqual(self.testModel.array_values[2], 20002)
    }
    
}
