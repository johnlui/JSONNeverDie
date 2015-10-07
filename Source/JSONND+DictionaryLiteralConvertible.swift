//
//  JSONND+DictionaryLiteralConvertible.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/7.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import Foundation

// stolen from SwiftyJSON
extension JSONND: DictionaryLiteralConvertible {
    public init(dictionaryLiteral elements: (String, AnyObject)...) {
        self.init(data: elements.reduce([String : AnyObject]()){(dictionary: [String : AnyObject], element:(String, AnyObject)) -> [String : AnyObject] in
            var d = dictionary
            d[element.0] = element.1
            return d
            })
    }
}