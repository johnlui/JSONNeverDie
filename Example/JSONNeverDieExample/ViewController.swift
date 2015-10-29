//
//  ViewController.swift
//  JSONNeverDieExample
//
//  Created by 吕文翰 on 15/9/27.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import UIKit
import JSONNeverDie

class People: JSONNDModel {
    var name = ""
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let data = NSData(contentsOfURL: NSURL(string: "http://httpbin.org/get?hello=world&hello2=123")!)!
        let json = JSONND.initWithData(data)
        print(json["args"]["hello"].stringValue)
        print(json.RAW)
        
        if let url = NSURL(string: "http://httpbin.org/get?hello=world") {
            if let data = NSData(contentsOfURL: url) {
                let json = JSONND.initWithData(data)
                print("json string: \(json.RAWValue)")
                print("GOT string for key 'hello': ", json["args"]["hello"].stringValue)
            }
        }
        
        // init from array
        let array = ["hello", 123, false]
        let arrayJSON = JSONND(array: array)
        print(arrayJSON.array?.first?.string)
        print(arrayJSON.array?[1].int)
        print(arrayJSON.array?[2].bool)
        print(arrayJSON.RAW)
        
        // init from dictionary
        let dic = ["hello": "NeverDie", "json": 200]
        let dicJSON = JSONND(dictionary: dic)
        print(dicJSON["hello"].string)
        print(dicJSON["json"].int)
        print(dicJSON.RAW)
        
        let jsonForModel = JSONND.initWithData(NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("Model", ofType: "json")!)!)
        let model = Model(JSONNDObject: jsonForModel)
        print(model.string)
        print(model.float)
        print(model.int)
        print(model.array_values.first)
        print(model.array.first?.key)
        print(model.hey.man.hello)
        
        self.testReflection()
    }
    
    func testReflection() {
        let json = JSONND(dictionary: ["name": "JohnLui"])
        let people = People(JSONNDObject: json)
        print(people.name) // get "JohnLui"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

