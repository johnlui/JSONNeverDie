//
//  ArrayTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest
@testable import JSONNeverDie

class ArrayTests: BaseTests {
    
    func testArrayNil() {
        XCTAssertNil(self.json["array_nil"].array)
        XCTAssertEqual(self.json["array_nil"].arrayValue.count, 0)
        
        self.json.data = "haha"
        XCTAssertNil(self.json.array)
    }
}
