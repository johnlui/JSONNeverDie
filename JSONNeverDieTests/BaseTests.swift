//
//  BaseTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest
@testable import JSONNeverDie

class BaseTests: XCTestCase {

    var json: JSONND!

    override func setUp() {
        super.setUp()
        JSONND.debug = true
        if let file = NSBundle(forClass:BaseTests.self).pathForResource("test", ofType: "json") {
            if let data = NSData(contentsOfFile: file) {
                self.json = JSONND.initWithData(data)
            } else {
                XCTFail("NSData from test JSON file is nil!")
            }
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }    
}
