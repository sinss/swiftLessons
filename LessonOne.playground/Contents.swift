//: Playground - noun: a place where people can play

import UIKit


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

//: 封裝
/*
 private     : 僅限同一個class / struct中使用
 fileprivate : 無法跨檔案
 internal   : 預設
 public     : 無法被繼承的。
 open       : 最高層級，就是Java語言的  public
 */

//: Class , struct
/**
 Class:  call by address
 Struct : call by value
 */

class A {
    private var strA: String
    fileprivate var intB: Int?
    
    //Compile時會自動，預設產生的
    required init() {
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

let objA = A()
let int = objA.intB

let structB = B(strA: "", intB: 0)

let valueB = structB.intB





