//
//  ShapeView.swift
//  SwiftEx-OOP
//
//  Created by 김도연 on 2/6/25.
//

import Foundation

class ShapeView {

//    var shapeList: [Shape]
    let shapeList: [Shape]

    init() {
        // init()함수의 목적은 초기화
        shapeList = []
    }

//    func showList() {
//        for shape in shapeList {
//            shape.draw()
//        }
//    }

//    func appendShpe(choice: Int) {
//        if choice == 1 {
//            shapeList.append(Circle())
//        } else if choice == 2 {
//            shapeList.append(Rectangle())
//        }
//    }
    
    func showList(_ list: [Shape]) {
        for shape in list {
            shape.draw()
        }
    }
    
    func appendShape(to list: [Shape], choice: Int) -> [Shape] {
        var newList = list
        if choice == 1 {
            newList.append(Circle())
        } else if choice == 2 {
            newList.append(Rectangle())
        }
        return newList
    }

    func main() {
        var currentList = shapeList
        
        for i in 1...5 {
            print("\(i)번째 생성할 객체 타입 선택 (1)Circle (2)Rectangle", terminator: ": ")
            let choice: Int = Int(readLine() ?? "") ?? 0
            
            switch choice {
            case 1, 2:
                currentList = appendShape(to: currentList, choice: choice)
            default:
                print("잘못된 객체 타입입니다.")
            }
        }
        
        showList(currentList)
    }
}
