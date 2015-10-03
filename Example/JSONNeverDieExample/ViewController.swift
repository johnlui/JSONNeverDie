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
    var number = 0
    var array = [Int]()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let data = NSData(contentsOfURL: NSURL(string: "http://httpbin.org/get?hello=world&hello2=123")!)!
        let json = JSONND.initWithData(data)
        print(json["args"]["hello"].stringValue)
        print(json.jsonString)
        
        if let url = NSURL(string: "http://httpbin.org/get?hello=world") {
            if let data = NSData(contentsOfURL: url) {
                let json = JSONND.initWithData(data)
                print("json string: \(json.jsonStringValue)")
                print("GOT string for key 'hello': ", json["args"]["hello"].stringValue)
            }
        }
        
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
        let data = "{\"name\": \"JohnLui\"}".dataUsingEncoding(NSUTF8StringEncoding)
        let json = JSONND.initWithData(data!)
        let people = People(JSONNDObject: json)
        print(people.name) // get "JohnLui"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

