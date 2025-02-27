//
//  CalculatorViewModel.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/27/25.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {
    @Published private var model = CalculatorModel()
    
    var displayText: String {
        model.currentExpression
    }
    
    func inputNumber(_ number: String) {
        if model.currentExpression == "0" {
            model.currentExpression = number
        } else {
            model.currentExpression += number
        }
    }
    
    func inputOperator(_ op: Operation) {
        let trimmedExpression = model.currentExpression.trimmingCharacters(in: .whitespaces)
        
        if let lastChar = trimmedExpression.last, "+-✕÷%".contains(lastChar) {
            return
        }
        model.currentExpression += " \(op.rawValue) "
    }
    
    // AC버튼
    func reset() {
        model = CalculatorModel()
    }
    
    func calculateResult() {
        var expressionString = model.currentExpression
            .replacingOccurrences(of: Operation.divide.rawValue, with: "/")
            .replacingOccurrences(of: Operation.multiply.rawValue, with: "*")
        
        expressionString = expressionString.replacingOccurrences(of: " % ", with: " / 100 ")
        
        let expression = NSExpression(format: expressionString)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            model.currentExpression = result.formattedString
        } else {
            model.currentExpression = "Error"
        }
    }
    
    func inputDecimal() {
        let components = model.currentExpression.split(separator: " ")
        if let lastComponent = components.last, lastComponent.contains(".") {
            return
        }
        model.currentExpression += "."
    }
    
    func toggleSign() {
        guard !model.currentExpression.isEmpty else { return }

        var components = model.currentExpression.split(separator: " ").map { String($0) }
        
        if let last = components.last, let number = Double(last) {
            let toggledNumber = -number
            components[components.count - 1] = toggledNumber.formattedString
        }
        
        model.currentExpression = components.joined(separator: " ")
    }
    
}

