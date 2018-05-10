//
//  ViewController.swift
//  LessonOne
//
//  Created by Leo.chang on 2018/5/10.
//  Copyright © 2018 chinalife. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //test()
        封裝()
        //optionalTest()
//        switchTest()
//        arrayNormal()
        //arrayAdvanced()
//        arrayAdvanced2()
//        dictionary()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func test() {
        
        //:  基本語法
        /*
         var   會變動的
         let　　固定常數
         String, Int, Int8 ~ 32, UInt8 ~ 32, Float, Double
         一個十進制數，沒有前綴
         一個二進制數，前綴是0b
         一個八進制數，前綴是0o
         一個十六進制數，前綴是0x
         typealias
         */
        let decimalInteger = 17
        let binaryInteger = 0b10001       // 二進制的 17
        let octalInteger = 0o21           // 八進制的 17
        let hexadecimalInteger = 0x11     // 十六進制的 17
        //浮點數
        let decimalDouble = 12.1875
        let exponentDouble = 1.21875e1
        let hexadecimalDouble = 0xC.3p0
        let paddedDouble = 000123.456
        let oneMillion = 1_000_000
        let justOverOneMillion = 1_000_000.000_000_1
        let newString = "17"
        
        let int_double = decimalInteger + Int(decimalDouble)            //變成Integer
        let int_double2 = Double(decimalInteger) + decimalDouble        //變成Double
        let combinedString = newString + newString
        
        //重新定義了整數型別
        typealias CHINA_LIFE_INTEGER = UInt8
        
        let minUInt: CHINA_LIFE_INTEGER = CHINA_LIFE_INTEGER.min
        let maxUInt = CHINA_LIFE_INTEGER.max
        
        /*
         Tuples 複合值
         */
        let http200Status = (statusCode: 200, description: "OK")
        print(http200Status.statusCode)
        print(http200Status.description)
    }
    
    //: Class , struct
    /**
     final class (cannot be override)
     Class:  call by address
     Struct : call by value
     */
    
    public class A {
        private var strA: String
        fileprivate var intB: Int?
        
        //Compile時會自動，預設產生的
        required public init() {
            self.strA = ""
        }
    }
    
    struct B {
        var strA: String
        var intB: Int
        
        //Compile時會動產生
        init(strA: String, intB: Int) {
            self.strA = ""
            self.intB = 0
        }
    }
    
    func 封裝() {
        //: 封裝
        /*
         private     : 僅限同一個class / struct中使用
         fileprivate : 無法跨檔案
         internal   : 預設
         public     : 不同模組無法被繼承的。
         open       : 最高層級，就是Java語言的  public
         */
        
        let objA = A()
        let int = objA.intB
        
        let structB = B(strA: "", intB: 0)
        
        let valueB = structB.intB
    }
    
    var textField: UITextField? = UITextField()
    
    func optionalTest() {
        let optionString: String? = "I am a optional string"
        print(optionString!)
        
        let nonOptionalString: String = "I am none optional string"
        print(nonOptionalString)
        
        //assert(textField != nil, "TextField is nil")
        
        print(textField?.text)
        print(textField!.text)
        if textField != nil {
            print(textField?.text)
        }
        //基本判斷
        if let field = textField {
            print(field.text)
        }
        //使用Guard
        guard let field2 = textField else {
            return
        }
        print(field2.text)
    }
    
    func switchTest() {
        let a = "10"
        let b = 2
        let c = 90
        switch a {
        case "1":
            break
        case "2":
            break
        case "10":
            print("a is correct")
        default:
            break
        }
        
        switch b {
        case 1:
            break
        case 2:
            print("b is correct")
        default:
            break
        }
        
        switch c {
        case 0...50:
            break
        case 51..<90:
            print("c is during 51 ~ 89")
        case 90...100:
            print("c is during 90 ~ 100")
        default:
            break
        }
        
        switch a {
        case "1", "2", "3", "4", "5":
            break
        default:
            break
        }
        
        //advanced
        switch (a, b) {
            case ("1", 0):
            print("")
        case ("10", 2):
            print("a , b is correct")
        default:
            print("")
        }
    }
    /**
     any
     array
     dictionary
     */
    func arrayNormal() {
        let strings = ["Anna", "Alex", "Brian", "Jack", "Leo"]
        let ints = [1, 2, 3, 4, 5, 6]
        //: 傳統方法
        for i in 0..<strings.count {
            print(strings[i])
        }
        
        //: foreach 方法
        for str in strings {
            print(str)
        }
        
        for int in ints {
            print(int)
        }
    }
    
    func arrayAdvanced() {
        let items: [Any] = ["Anna", "Alex", "Brian", 10, 20]
        print(items)
        
        for case let item as String in items {
            print(item)
        }
        
        for case let item as Int in items {
            print(item)
        }
    }
    
    func arrayAdvanced2() {
        let strings = ["Anna", "Alex", "Brian", "Jack", "Leo"]
        print(strings)
        let matchedStrings = strings.filter { $0.contains("A") }
        print(matchedStrings)
        let ints = [9, 98 , 7, 96 , 45 , 4 , 93 , 102, 1001, 99]
        print(ints)
        
        let sortedInts = ints.sorted { return $0 < $1 }
        print(sortedInts)
        let sortedInts2 = ints.sorted { return $0 > $1 }
        print(sortedInts2)
        
        struct User {
            var name: String
            var age: Int
        }
        let items = [User(name: "Anna", age: 10), User(name: "Alex", age: 20), User(name: "Brian", age: 30), User(name: "Jack", age: 40), User(name: "Leo", age: 32)]
        let filtered = items.filter { $0.name.contains("A") }
        for item in filtered {
            print("name: \(item.name), age: \(item.age)")
        }
        print("============= Original ===================")
        for item in items {
            print("name: \(item.name), age: \(item.age)")
        }
        print("============ Sort by Age =================")
        let sortedByAge = items.sorted { $0.age > $1.age }
        for item in sortedByAge {
            print("name: \(item.name), age: \(item.age)")
        }
    }
    
    func dictionary() {
        let dict = ["key1": "value1", "key2": "value2", "key3": "value3"]
        print(dict["key2"])
        
        for case let (key, value) as (String, Int) in dict {
            print("key: \(key), value: \(value)")
        }
    }
}
