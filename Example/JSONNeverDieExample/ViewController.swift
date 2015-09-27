//
//  ViewController.swift
//  JSONNeverDieExample
//
//  Created by 吕文翰 on 15/9/27.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import UIKit
import JSONNeverDie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = NSData(contentsOfURL: NSURL(string: "http://httpbin.org/get?hello=world")!)!
        let json = JSONND.initWithData(data)
        print(json["args"]["hello"].stringValue)
        if let url = NSURL(string: "http://httpbin.org/get?hello=world") {
            if let data = NSData(contentsOfURL: url) {
                let json = JSONND.initWithData(data)
                print("json string: \(json.jsonStringValue)")
                print("GOT string for key 'hello': ", json["args"]["hello"].stringValue)
            }
        }
        let string = json.jsonString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

