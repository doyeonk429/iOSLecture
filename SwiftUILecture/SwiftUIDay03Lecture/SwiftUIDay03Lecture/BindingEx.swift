//
//  BindingEx.swift
//  SwiftUIDay03Lecture
//
//  Created by 김도연 on 2/12/25.
//

import SwiftUI

struct BindingEx: View {
    @State private var isOn = false
    var body: some View {
        VStack(spacing: 16) {
            Text("isOn : \(isOn)")
                .font(.title)
                .foregroundStyle(.cyan)
            ToggleView(isOn: $isOn)
        }
    }
}

struct ToggleView: View {
    @Binding var isOn: Bool
    var body: some View {
        Toggle("switch", isOn: $isOn)
            .padding(.horizontal, 20)
    }
}

#Preview {
    BindingEx()
}
