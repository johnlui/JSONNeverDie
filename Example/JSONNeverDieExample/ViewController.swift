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
        let json = JSONND(string: "{\"name\": \"JohnLui\"}")
        let people = People(JSONNDObject: json)
        print(people.name)

        if let url = URL(string: "http://httpbin.org/get?hello=world"),
            let string = try? String(contentsOf: url, encoding: String.Encoding.utf8) {
                let json1 = JSONND(string: string)
                print(json1["args"]["hello"].stringValue)
                print(json1.RAW)
        }
        
        if let url = URL(string: "http://httpbin.org/get?hello=world"),
            let string = try? String(contentsOf: url, encoding: String.Encoding.utf8) {
                let json = JSONND(string: string)
                print("json string: \(json.RAWValue)")
                print("GOT string for key 'hello': ", json["args"]["hello"].stringValue)
        }
        
        // init from array
        let array = ["hello", 123, false] as [Any]
        let arrayJSON = JSONND(array: array as [AnyObject])
        print(arrayJSON.array?.first?.string)
        print(arrayJSON.array?[1].int)
        print(arrayJSON.array?[2].bool)
        print(arrayJSON.RAW)
        
        // init from dictionary
        let dic = ["hello": "NeverDie", "json": 200] as [String : Any]
        let dicJSON = JSONND(dictionary: dic as [String : AnyObject])
        print(dicJSON["hello"].string)
        print(dicJSON["json"].int)
        print(dicJSON.RAW)
        
        if let url = Bundle.main.url(forResource: "Model", withExtension: "json"),
            let string = try? String(contentsOf: url, encoding: String.Encoding.utf8) {
            let jsonForModel = JSONND(string: string)
            let model = Model(JSONNDObject: jsonForModel)
            print(model.string)
            print(model.double)
            print(model.int)
            print(model.array_values.first)
            print(model.array.first?.key)
            print(model.hey.man.hello)
        }
        
        self.testReflection()
    }
    
    func testReflection() {
        let json = JSONND(dictionary: ["name": "JohnLui" as AnyObject])
        let people = People(JSONNDObject: json)
        print(people.name) // get "JohnLui"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

