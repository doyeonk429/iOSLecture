//
//  ToastView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct ToastView: View {
    var message: String

    var body: some View {
        Text(message)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.5))
            .cornerRadius(10)
            .padding(.top, 50)
            .transition(.move(edge: .top).combined(with: .opacity))
    }
}

#Preview {
    ToastView(message: "성공")
}
