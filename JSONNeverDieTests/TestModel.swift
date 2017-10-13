//
//  TestModel.swift
//  JSONNeverDie
//
//  Created by 吕文翰 on 15/10/3.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import Foundation
import JSONNeverDie

class TestModel: JSONNDModel {
    @objc var string = ""
    @objc var double = 0.0
    @objc var int = 0
    @objc var array_values = [Int]()
    @objc var array = [ModelOnlyOneKey]()
    @objc var hey: Hey!
    override init(JSONNDObject json: JSONND) {
        super.init(JSONNDObject: json)
        
        for i in json["array_values"].arrayValue {
            self.array_values.append(i.intValue)
        }
        for i in json["array"].arrayValue {
            self.array.append(ModelOnlyOneKey(JSONNDObject: i))
        }
        self.hey = Hey(JSONNDObject: json["hey"])
    }
}
class ModelOnlyOneKey: JSONNDModel {
    @objc var key = 0
}
class Hey: JSONNDModel {
    @objc var man: Man!
    override init(JSONNDObject json: JSONND) {
        super.init(JSONNDObject: json)
        
        self.man = Man(JSONNDObject: json["man"])
    }
}
class Man: JSONNDModel {
    @objc var hello = false
}
