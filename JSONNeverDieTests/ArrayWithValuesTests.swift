//
//  ArrayWithValuesTests.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/11.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import XCTest
@testable import JSONNeverDie

class ArrayWithValuesTests: BaseTests {
    
    var array: [JSONND]!
    
    override func setUp() {
        super.setUp()
        
        self.array = self.json["array_values"].arrayValue
    }
    
    func testArrayWithValues() {
        XCTAssertEqual(self.array[0].intValue, 10000)
        XCTAssertEqual(self.array[1].stringValue, "🙈")
        XCTAssertEqual(self.array[2].doubleValue, 0.03)
    }
}