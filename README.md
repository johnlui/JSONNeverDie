<p align="center">
    <a href="https://github.com/johnlui/JSONNeverDie"><img src="https://raw.githubusercontent.com/johnlui/JSONNeverDie/master/assets/logo.jpg"></a>
</p>

<p align="center">
    <a href="https://github.com/johnlui/JSONNeverDie"><img src="https://img.shields.io/badge/platform-ios-lightgrey.svg"></a>
    <a href="https://github.com/johnlui/JSONNeverDie"><img src="https://img.shields.io/github/license/johnlui/JSONNeverDie.svg?style=flat"></a>
    <a href="https://github.com/johnlui/JSONNeverDie"><img src="https://img.shields.io/badge/language-Swift%203-orange.svg"></a>
    <a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
    <a href="https://travis-ci.org/johnlui/JSONNeverDie"><img src="https://img.shields.io/travis/johnlui/JSONNeverDie.svg"></a>
</p>

JSONNeverDie is an auto reflection tool from JSON to Model, a user friendly JSON encoder / decoder, aims to never die.

### [中文介绍](#中文介绍)

## Example
set up a Model:

```swift
class People: JSONNDModel {
    var name = ""
}
```
reflex JSON to Model automatic:

```swift
let json = JSONND(string: "{\"name\": \"JohnLui\"}")
let people = People(JSONNDObject: json)
print(people.name)
```

## Features

### reflection features
- [x] JSON to Model reflection automatic
- [x] auto reflection with no need of init()
- [x] supports multi-level reflection

#### [Read the documentation of auto reflection](https://github.com/johnlui/JSONNeverDie/wiki).

### JSON encode / decode features
- [x] supports all types: Int, Double, Bool, String, Array
- [x] user friendly: Xcode can prompt all available types
- [x] provides both Optional-type(Int?) and Original-type(Int)

And JSONNeverDie is well tested.


## Requirements

* iOS 7.0+
* Swift 3 (Version 2) in current swift3 branch
* Swift 2.x / Xcode 7 (Version 1.x) in master branch


##Contribution

You are welcome to fork and submit pull requests.

##License

JSONNeverDie is open-sourced software licensed under the MIT license.

# 中文介绍

## 基本示例
构建一个 Model:

```swift
class People: JSONNDModel {
    var name = ""
}
```
从字符串转换成 JSON 再自动映射为 Model:

```swift
let json = JSONND(string: "{\"name\": \"JohnLui\"}")
let people = People(JSONNDObject: json)
print(people.name)
```

### [中文文档](https://github.com/johnlui/JSONNeverDie/wiki/%E4%B8%AD%E6%96%87%E6%96%87%E6%A1%A3)

## 参与开源

欢迎提交 issue 和 PR，大门永远向所有人敞开。

## 开源协议

本项目遵循 MIT 协议开源，具体请查看根目录下的 LICENSE 文件。

