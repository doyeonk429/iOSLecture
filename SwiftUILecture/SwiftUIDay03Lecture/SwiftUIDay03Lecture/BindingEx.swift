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
            Text("Parent's isOn : \(isOn)")
                .font(.title)
                .foregroundStyle(.cyan)
            ToggleView(isOn: $isOn)
        }
    }
}

struct ToggleView: View {
    @Binding var isOn: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Toggle("switch", isOn: $isOn)
            Text("child's isOn : \(isOn)")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    BindingEx()
}
