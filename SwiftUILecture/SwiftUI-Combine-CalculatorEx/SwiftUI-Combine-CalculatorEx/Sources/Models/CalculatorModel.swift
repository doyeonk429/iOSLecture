//
//  CalculatorModel.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/27/25.
//

import Foundation

enum Operation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "✕"
    case divide = "÷"
    case percent = "%"
}

struct CalculatorModel {
    var currentExpression: String = "0"
}
