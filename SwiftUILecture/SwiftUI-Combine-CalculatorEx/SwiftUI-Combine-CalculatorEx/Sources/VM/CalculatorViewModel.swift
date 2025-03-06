//
//  CalculatorViewModel.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/27/25.
//

import SwiftUI
import Combine

final class CalculatorViewModel: ObservableObject {
    @Published private var model = CalculatorModel()
    private var cancellables = Set<AnyCancellable>()
    
    @Published public var displayText: String = "0"
    
    private let numberInput = PassthroughSubject<String, Never>()
    private let operatorInput = PassthroughSubject<Operation, Never>()
    private let calculateSubject = PassthroughSubject<Void, Never>()
    
    init() {
        setupBindings()
    }
    
    //MARK: - Bind Model
    
    private func setupBindings() {
        bindDisplayText()
        bindNumberInput()
        bindOperatorInput()
        bindCalculation()
    }

    private func bindDisplayText() {
        model.$currentExpression
            .receive(on: RunLoop.main)
            .assign(to: &$displayText)
    }
    
    private func bindNumberInput() {
        numberInput
            .map { [weak self] number in
                guard let self = self else { return "" }
                return self.model.currentExpression == "0" ? number : self.model.currentExpression + number
            }
            .assign(to: \.model.currentExpression, on: self)
            .store(in: &cancellables)
    }
    
    private func bindOperatorInput() {
        operatorInput
            .map { [weak self] op in
                guard let self = self else { return "" }
                let trimmedExpression = self.model.currentExpression.trimmingCharacters(in: .whitespaces)
                if let lastChar = trimmedExpression.last, "+-✕÷%".contains(lastChar) {
                    return self.model.currentExpression
                }
                return self.model.currentExpression + " \(op.rawValue) "
            }
            .assign(to: \.model.currentExpression, on: self)
            .store(in: &cancellables)
    }
    
    private func bindCalculation() {
        calculateSubject
            .map { [weak self] _ in
                guard let self = self else { return "Error" }
                return self.evaluateExpression()
            }
            .assign(to: \.model.currentExpression, on: self)
            .store(in: &cancellables)
    }
    
    //MARK: - Public Funcs
    
    func inputNumber(_ number: String) {
        numberInput.send(number)
    }

    func inputOperator(_ op: Operation) {
        operatorInput.send(op)
    }

    func calculateResult() {
        calculateSubject.send(())
    }

    func reset() {
        model.currentExpression = "0"
    }
    
    // 리팩토링 대상에서 일단 제외
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
    
    // 수식 변환
    private func evaluateExpression() -> String {
        var expressionString = model.currentExpression
            .replacingOccurrences(of: Operation.divide.rawValue, with: "/")
            .replacingOccurrences(of: Operation.multiply.rawValue, with: "*")
        
        expressionString = expressionString.replacingOccurrences(of: " % ", with: " / 100 ")
        
        let expression = NSExpression(format: expressionString)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            return result.formattedString
        } else {
            return "Error"
        }
    }
    
}

