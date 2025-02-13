//
//  PadView.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

struct PadView: View {
    private let spacing = AppConstant.UI.numberPadSpacing
    
    var body: some View {
        VStack(spacing: spacing) {
            
            HStack(spacing: spacing) {
                Button("AC", action: {})
                    .buttonStyle(NumberPadStyle())
                Button("+/-", action: {})
                    .buttonStyle(NumberPadStyle())
                Button("%", action: {})
                    .buttonStyle(NumberPadStyle())
                Button("÷", action: {})
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack
            
            HStack(spacing: spacing) {
                Button("7", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("8", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("9", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("✕", action: {})
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack
            
            HStack(spacing: spacing) {
                Button("4", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("5", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("6", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("-", action: {})
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack
            
            HStack(spacing: spacing) {
                Button("1", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("2", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("3", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("+", action: {})
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack
            
            HStack(spacing: spacing) {
                Button("0", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray, isWide: true))
                Button(".", action: {})
                    .buttonStyle(NumberPadStyle(color: .darkgray))
                Button("=", action: {})
                    .buttonStyle(NumberPadStyle(color: .orange))
            } // : HStack

        }
    }
}

#Preview {
    PadView()
}
