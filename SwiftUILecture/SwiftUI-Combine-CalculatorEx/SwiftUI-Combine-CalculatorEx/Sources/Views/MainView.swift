//
//  MainView.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

struct MainView: View {
    @Binding var number: Double
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("\(number)")
                    .frame(width: geometry.size.width, alignment: .trailing)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                PadView()
            } // : VStack
            .padding(.bottom, 30)
        } // : GeometryReader
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainView(number: .constant(0))
}
