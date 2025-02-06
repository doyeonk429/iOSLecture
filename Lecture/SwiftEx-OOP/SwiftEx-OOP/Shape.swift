//
//  Shape.swift
//  SwiftEx-OOP
//
//  Created by 김도연 on 2/6/25.
//

import Foundation

class Shape {
    //MARK: - Properties
    var shapeName : String
    
    init(shapeName: String = "") {
        self.shapeName = shapeName
    }
    
    //MARK: - Methods
    func draw() {
        print("draw a shape")
    }
}

class Circle : Shape {
    override func draw() {
        print("draw a circle🔵")
    }
}

class Rectangle : Shape {
    override func draw() {
        print("draw a rectangle🟦")
    }
}


