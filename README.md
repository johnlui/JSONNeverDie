JSONNeverDie [中文文档](https://github.com/johnlui/JSONNeverDie/wiki/%E4%B8%AD%E6%96%87%E6%96%87%E6%A1%A3)
---------
![Platform](https://camo.githubusercontent.com/770175f6c01d89c84a020706126a9e6399ff76c4/68747470733a2f2f696d672e736869656c64732e696f2f636f636f61706f64732f702f4b696e676669736865722e7376673f7374796c653d666c6174) ![License](https://img.shields.io/github/license/johnlui/JSONNeverDie.svg?style=flat) ![Language](https://img.shields.io/badge/language-Swift%202-orange.svg) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Travis](https://img.shields.io/travis/johnlui/JSONNeverDie.svg)](https://travis-ci.org/johnlui/JSONNeverDie)

JSONNeverDie is an auto reflection tool from JSON to Model, a user friendly JSON encoder / decoder, aims to never die.
#### 中文文档

![logo](https://lvwenhan.com/content/uploadfile/201510/01021443880476.png)

## Example
set up a Model:

```swift
class People: JSONNDModel {
    var name = ""
}
```
reflex JSON to Model automatic:

```swift
let data = "{\"name\": \"JohnLui\"}".dataUsingEncoding(NSUTF8StringEncoding)
let json = JSONND.initWithData(data!)
let people = People(JSONNDObject: json)
print(people.name) // get "JohnLui"
```

## Features

### reflection features
- [x] JSON to Model reflection automatic
- [x] auto reflection with no need of init()
- [x] supports multi-level reflection

#### [Read the documentation of auto reflection](https://github.com/johnlui/JSONNeverDie/wiki).

### JSON encode / decode features
- [x] supports all types: Int, Float, Bool, String, Array
- [x] user friendly: Xcode can prompt all available types
- [x] provides both Optional-type(Int?) and Original-type(Int)

And JSONNeverDie is well tested.


## Requirements

* iOS 7.0+
* Xcode 7


## Use

### import

```swift
import JSONNeverDie
```

### basic decoding example
parse a JSON from network and get a string:

```swift
let data = NSData(contentsOfURL: NSURL(string: "http://httpbin.org/get?hello=world")!)!
let json = JSONND.initWithData(data)
print(json["args"]["hello"].stringValue)
```

### generate a JSONND object

```swift
// init from NSData
let data = NSData(contentsOfURL: NSURL(string: "http://httpbin.org/get?hello=world")!)!
let json = JSONND.initWithData(data)

// init from Array
let arrayJSON = JSONND(array: ["hello", "world", 100])

// init from Dictionary
let dictionaryJSON = JSONND(dictionary: ["hello": "world", "hey": "guys"])
```

### get values

```swift
let value = json["key"].int
let value = json["key"].intValue
let value = json["key"].string
let value = json["key"].stringValue
let value = json["key"].float
let value = json["key"].floatValue
let value = json["key"].bool
let value = json["key"].boolValue
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

### Xcode can prompt all available types

![pic](http://1.staticonsae.sinaapp.com/images/QQ20150927-1@2x.png)

### get raw string from a JSONND object

```swift
let string = json.RAW
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

Clone all files in the `Source` directory into your project.


##Contribution

You are welcome to fork and submit pull requests.

##License

JSONNeverDie is open-sourced software licensed under the MIT license.

# 中文文档

## 基本示例
构建一个 Model:

```swift
class People: JSONNDModel {
    var name = ""
}
```
从字符串转换成 JSON 再自动映射为 Model:

```swift
let data = "{\"name\": \"JohnLui\"}".dataUsingEncoding(NSUTF8StringEncoding)
let json = JSONND.initWithData(data!)
let people = People(JSONNDObject: json)
print(people.name) // get "JohnLui"
```
