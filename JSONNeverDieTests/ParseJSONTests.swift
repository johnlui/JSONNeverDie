//
//  ParseJSONTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest

class ParseJSONTests: BaseTests {

    func testParseJSON() {
        XCTAssertNotNil(self.json.data, "JSONND.jsonObject should not be nil!")
    }
}
