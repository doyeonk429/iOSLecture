//
//  MainView.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text(viewModel.displayText)
                    .frame(width: geometry.size.width, alignment: .trailing)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                PadView(viewModel: viewModel)
            } // : VStack
            .padding(.bottom, 30)
        } // : GeometryReader
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainView()
}
