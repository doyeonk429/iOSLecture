//
//  exercise.swift
//  SwiftEx-OOP
//
//  Created by 김도연 on 2/6/25.
//

import Foundation

class Car {
    var color : String
    var speed : Int
    
    init(color: String, speed: Int) {
        self.color = color
        self.speed = speed
    }
    
    //MARK: - methods
    func drive() {
        print("\(color) 자동차가 \(speed)km/h로 달림")
    }
}
