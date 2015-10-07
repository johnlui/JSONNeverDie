//
//  JSONND+ArrayLiteralConvertible.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/7.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import Foundation

// stolen from SwiftyJSON
extension JSONND: ArrayLiteralConvertible {
    public init(arrayLiteral elements: AnyObject...) {
        self.init(data: elements)
    }
}