//
//  JSONNeverDie.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/9/26.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import Foundation

public struct JSONND {
    public var jsonObject: AnyObject!
    public static func initWithData(data: NSData) -> JSONND! {
        do {
            return JSONND(jsonObject: try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments))
        } catch let error as NSError {
            let e = NSError(domain: "JSONNeverDie.JSONParseError", code: error.code, userInfo: error.userInfo)
            NSLog(e.localizedDescription)
            return JSONND()
        }
    }
    public var jsonString: String? {
        let jsonNDElement = JSONNDElement(data: self.jsonObject)
        return jsonNDElement.jsonString
    }
    public var jsonStringValue: String {
        let jsonNDElement = JSONNDElement(data: self.jsonObject)
        return jsonNDElement.jsonStringValue
    }
    public subscript (index: String) -> JSONNDElement {
        let jsonNDElement = JSONNDElement(data: self.jsonObject)
        return jsonNDElement[index]
    }
}

public struct JSONNDElement {
    public var data: AnyObject!
    public init(data: AnyObject!) {
        self.data = data
    }
    public subscript (index: String) -> JSONNDElement {
        if let jsonDictionary = self.data as? Dictionary<String, AnyObject> {
            if let value = jsonDictionary[index] {
                return JSONNDElement(data: value)
            } else {
                NSLog("JSONNeverDie: No such key '\(index)'")
            }
        }
        return JSONNDElement(data: nil)
    }
    public var jsonString: String? {
        get {
            do {
                if let _ = self.data {
                    return NSString(data: try NSJSONSerialization.dataWithJSONObject(self.data, options: .PrettyPrinted), encoding: NSUTF8StringEncoding) as? String
                } else {
                    return nil
                }
            } catch {
                return nil
            }
        }
    }
    public var jsonStringValue: String {
        get {
            if let i = self.jsonString {
                return i
            } else {
                return ""
            }
        }
    }
    public var int: Int? {
        get {
            if let _ = self.data {
                return self.data.integerValue
            } else {
                return nil
            }
        }
    }
    public var intValue: Int {
        get {
            if let i = self.int {
                return i
            } else {
                return 0
            }
        }
    }
    public var float: Float? {
        get {
            if let _ = self.data {
                return self.data.floatValue
            } else {
                return nil
            }
        }
    }
    public var floatValue: Float {
        get {
            if let i = self.float {
                return i
            } else {
                return 0
            }
        }
    }
    public var string: String? {
        get {
            if let _ = self.data {
                return self.data as? String
            } else {
                return nil
            }
        }
    }
    public var stringValue: String {
        get {
            if let i = self.string {
                return i
            } else {
                return ""
            }
        }
    }
    public var bool: Bool? {
        get {
            if let _ = self.data {
                return self.data as? Bool
            } else {
                return nil
            }
        }
    }
    public var boolValue: Bool {
        get {
            if let i = self.bool {
                return i
            } else {
                return false
            }
        }
    }
    public var array: [JSONNDElement]? {
        get {
            if let _ = self.data {
                if let arr = self.data as? Array<AnyObject> {
                    var result = Array<JSONNDElement>()
                    for i in arr {
                        result.append(JSONNDElement(data: i))
                    }
                    return result
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
    }
    public var arrayValue: [JSONNDElement] {
        get {
            if let i = self.array {
                return i
            } else {
                return []
            }
        }
    }
}

// stolen from SwiftyJSON
extension JSONND: DictionaryLiteralConvertible {
    public init(dictionaryLiteral elements: (String, AnyObject)...) {
        self.init(jsonObject: elements.reduce([String : AnyObject]()){(dictionary: [String : AnyObject], element:(String, AnyObject)) -> [String : AnyObject] in
            var d = dictionary
            d[element.0] = element.1
            return d
            })
    }
}
// stolen from SwiftyJSON
extension JSONND: ArrayLiteralConvertible {
    public init(arrayLiteral elements: AnyObject...) {
        self.init(jsonObject: elements)
    }
}
