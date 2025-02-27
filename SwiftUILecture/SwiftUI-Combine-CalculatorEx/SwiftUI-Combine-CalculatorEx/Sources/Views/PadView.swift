//
//  PadView.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

struct PadView: View {
    let viewModel: CalculatorViewModel
    
    private let spacing = AppConstant.UI.numberPadSpacing
    
    var body: some View {
        VStack(spacing: spacing) {
            
            HStack(spacing: spacing) {
                Button("AC", action: { viewModel.reset() })
                    .buttonStyle(NumberPadStyle())
                Button("+/-", action: { viewModel.toggleSign() })
                    .buttonStyle(NumberPadStyle())
                Button("%", action: { viewModel.inputOperator(.percent) })
                    .buttonStyle(NumberPadStyle())
                Button("÷", action: { viewModel.inputOperator(.divide) })
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack
            
            HStack(spacing: spacing) {
                Button("7", action: { viewModel.inputNumber("7") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("8", action: { viewModel.inputNumber("8") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("9", action: {viewModel.inputNumber("9") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("✕", action: { viewModel.inputOperator(.multiply) })
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack
            
            HStack(spacing: spacing) {
                Button("4", action: { viewModel.inputNumber("4") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("5", action: {viewModel.inputNumber("5") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("6", action: {viewModel.inputNumber("6") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("-", action: { viewModel.inputOperator(.subtract) })
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack
            
            HStack(spacing: spacing) {
                Button("1", action: { viewModel.inputNumber("1") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("2", action: { viewModel.inputNumber("2") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("3", action: { viewModel.inputNumber("3") })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("+", action: { viewModel.inputOperator(.add) })
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack
            
            HStack(spacing: spacing) {
                Button("0", action: { viewModel.inputNumber("0") })
                    .buttonStyle(NumberPadStyle(color: .darkgray, isWide: true))
                Button(".", action: { viewModel.inputDecimal() })
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("=", action: { viewModel.calculateResult() })
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack

        }
    }
}

#Preview {
    PadView(viewModel: CalculatorViewModel())
}
