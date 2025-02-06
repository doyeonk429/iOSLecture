//
//  main.swift
//  SwiftEx-OOP
//
//  Created by 김도연 on 2/6/25.
//

import Foundation

//MARK: - Cars
//let sonata = Car(color: "검정", speed: 110)
//let grandeur = Car(color: "하얀색", speed: 140)
//
//let cars = [sonata, grandeur]
//
//for car in cars {
//    car.drive()
//}

//MARK: - Shape
var shapeArr = [Shape]()
shapeArr.append(Circle(shapeName: "원"))
shapeArr.append(Rectangle(shapeName: "사각형"))

for shape in shapeArr {
    shape.draw()
}
