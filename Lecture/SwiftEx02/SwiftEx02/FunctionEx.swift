//
//  FunctionEx.swift
//  SwiftEx02
//
//  Created by 김도연 on 2/5/25.
//

import Foundation

struct FunctionEx {
    
    func run() {
        
        print("run FunctionEx")
        example01(title: "더하기 예제")
        
    }
    
    func example01(title: String) {
        print("첫번째 예제는 \(title)입니다.")
        
        
        let value1: Int = 100
        let value2: Int = 150
        let total = add(x: value1, y:value2)
        print("\(value1) 더하기 \(value2)는 \(total)입니다.")
        
        let info = FunctionEx02().getUserInfo()
    }
    
    func add(x: Int, y: Int) -> Int {
        return x + y
    }
}

struct FunctionEx02 {
    
    func getUserInfo() -> (name: String, age: Int) {
        print("이름 입력: ", terminator: "")
        let name = readLine() ?? ""
        
        print("나이 입력: ", terminator: "")
        let age = Int(readLine() ?? "1")!
        
        return (name, age)
    }
    
    
}
