//
//  JSONNDModel.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/3.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import Foundation

public class JSONNDModel: NSObject {
    
    public var JSONNDObject: JSONND!
    
    public required init(JSONNDObject json: JSONND) {
        self.JSONNDObject = json
        super.init()
        
        let mirror = Mirror(reflecting: self)
        if mirror.superclassMirror()?.children.count == 0 {
            return
        }
        for (k, v) in AnyRandomAccessCollection(mirror.children)! {
            if let key = k {
                let json = self.JSONNDObject[key]
                var valueWillBeSet: AnyObject?
                switch v {
                case _ as String:
                    valueWillBeSet = json.stringValue
                case _ as Int:
                    valueWillBeSet = json.intValue
                case _ as Float:
                    valueWillBeSet = json.floatValue
                case _ as Bool:
                    valueWillBeSet = json.boolValue
                case _ as JSONNDModel:
                    if let cls = NSClassFromString("JSONNeverDieExample." + key.capitalizedString) as? JSONNDModel.Type {
                        valueWillBeSet = cls.init(JSONNDObject: json)
                    }
                default:
                    break
                }
                self.setValue(valueWillBeSet, forKey: key)
            }
        }
    }
    
    public var jsonString: String? {
        get {
            if let _ = self.JSONNDObject {
                return self.JSONNDObject.jsonString
            } else {
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
}
