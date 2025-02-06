//
//  ShapeView.swift
//  SwiftEx-OOP
//
//  Created by 김도연 on 2/6/25.
//

import Foundation

class ShapeView {

    var shapeList: [Shape]

    init() {
        // init()함수의 목적은 초기화
        shapeList = []
    }

    func showList() {
        for shape in shapeList {
            shape.draw()
        }
    }

    func appendShpe(choice: Int) {
        if choice == 1 {
            shapeList.append(Circle())
        } else if choice == 2 {
            shapeList.append(Rectangle())
        }
    }

    func main() {

        // 5회 반복 Shape 생성
        // 1번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle: 1
        // 리스트에 Circle 객체 추가 완료!
        // 2번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle: 2
        // 리스트에 Rectangle 객체 추가 완료!
        // 3번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle:

        for i in 1...5 {
            print("\(i)번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle", terminator: ": ")
            let choice: Int = Int(readLine() ?? "") ?? 0
            switch choice {
            case 1:
                appendShpe(choice: choice)
            case 2:
                appendShpe(choice: choice)
            default:
                print("잘못된 객체 타입입니다.")
            }
            
        }

        showList()

    }
}
