//
//  ButtonStyles.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

struct NumberPadStyle : ButtonStyle {
    private var color : Color
    private var isWide : Bool
    
    init(color : Color = .gray, isWide : Bool = false) {
        self.color = color
        self.isWide = isWide
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let wholeSpacing = AppConstant.UI.numberPadSpacing * 5
        let screenWidth = UIScreen.size.width
        let size = (screenWidth - wholeSpacing) / 4
        let width = isWide ? (screenWidth - wholeSpacing) / 2 + AppConstant.UI.numberPadSpacing : size
        let height = size

        let buttonView = configuration.label
            .frame(width: width, height: height, alignment: .center)
            .background(color)
            .font(.system(size: 32, weight: .medium))
            .foregroundStyle(.white)
        
        if isWide {
            buttonView.clipShape(.capsule)
        } else {
            buttonView.clipShape(.circle)
        }
    }
}
