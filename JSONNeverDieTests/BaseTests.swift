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
        if let url = Bundle(for:BaseTests.self).url(forResource: "test", withExtension: "json") {
            if let string = try? String(contentsOf: url, encoding: String.Encoding.utf8) {
                self.json = JSONND(string: string)
            } else {
                XCTFail("NSData from test JSON file is nil!")
            }
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }    
}
