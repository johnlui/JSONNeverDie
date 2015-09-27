JSONNeverDie ![Platform](https://img.shields.io/cocoapods/p/Kingfisher.svg?style=flat) ![License](https://img.shields.io/cocoapods/l/Kingfisher.svg?style=flat) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
---------

JSONNeverDie aims to be a user friendly JSON encode / decoder which never die.

## Features

- [x] supports all types: Int, Float, String, Array
- [x] user friendly: Xcode can prompt all available methods
- [x] provides both Optional-type(Int?) and Original-type(Int)
- [x] well tested


## Requirements

* iOS 7.0+
* Xcode 7


## Use

### import

```swift
import JSONNeverDie
```

### basic example
parse a JSON from network and get a string:

```swift
let data = NSData(contentsOfURL: NSURL(string: "http://httpbin.org/get?hello=world")!)!
let json = JSONND.initWithData(data)
print(json["args"]["hello"].stringValue)
```

### generate a JSONND object

```swift
let data = NSData()

// init from NSData
let json = JSONND.initWithData(data)
// init from Array
let jsonArray: JSONND = ["hello", "world", 100]
// init from Dictionary
let jsonDictionary: JSONND = ["hello": "world", "hey": "guys"]
```

### get values

```swift
let value = json["key"].int
let value = json["key"].intValue
let value = json["key"].string
let value = json["key"].stringValue
let value = json["key"].float
let value = json["key"].floatValue
let value = json["key"].array
let value = json["key"].arrayValue

// more than one level
let value = json["key"]["key1"]["key2"].int
```

### deal with array

```swift
if let jsonArray = json["array"].array {
    for jsonItem in jsonArray {
        let value = jsonItem["key"].int
    }
}

// or just
let value = json["array"].arrayValue[0]["key"].int
```

### Xcode can prompt all available methods

![pic](http://1.staticonsae.sinaapp.com/images/QQ20150927-1@2x.png)

### get raw string from a JSONND object

```swift
let string = json.jsonString
```


## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with Homebrew using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate JSONNeverDie into your Xcode project using Carthage, specify it in your Cartfile:

```json
github "JohnLui/JSONNeverDie"
```

Then fetch and build JSONNeverDie:

```bash
carthage update
```

At last, add it to "Embedded Binaries" in the general panel use the "Add Other..." button. The JSONNeverDie.framework binary file is lying in `./Carthage/Build/iOS` directory.


### Manually

```bash
git submodule add https://github.com/johnlui/JSONNeverDie.git
open JSONNeverDie
```
then drag JSONNeverDie.xcodeproj to your Project, that's it!

If you want to run your project on device with JSONNeverDie, just go to PROJECT->TARGETS->[your project name]->General->Embedded Binaries, click ＋, select JSONNeverDie.frameWork and click "Add".

### Source File

Drag `JSONNeverDie/JSONNeverDie.swift` into your project.



##Contribution

You are welcome to fork and submit pull requests.

##License

JSONNeverDie is open-sourced software licensed under the MIT license.