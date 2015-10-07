//
//  JSONND.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/7.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import Foundation

public struct JSONND {
    public var data: AnyObject!
    public static func initWithData(data: NSData) -> JSONND! {
        do {
            return JSONND(data: try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments))
        } catch let error as NSError {
            let e = NSError(domain: "JSONNeverDie.JSONParseError", code: error.code, userInfo: error.userInfo)
            NSLog(e.localizedDescription)
            return JSONND()
        }
    }
    public init() {}
    public init(data: AnyObject!) {
        self.data = data
    }
    public subscript (index: String) -> JSONND {
        if let jsonDictionary = self.data as? Dictionary<String, AnyObject> {
            if let value = jsonDictionary[index] {
                return JSONND(data: value)
            } else {
                NSLog("JSONNeverDie: No such key '\(index)'")
            }
        }
        return JSONND(data: nil)
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
    public var array: [JSONND]? {
        get {
            if let _ = self.data {
                if let arr = self.data as? Array<AnyObject> {
                    var result = Array<JSONND>()
                    for i in arr {
                        result.append(JSONND(data: i))
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
    public var arrayValue: [JSONND] {
        get {
            if let i = self.array {
                return i
            } else {
                return []
            }
        }
    }
}