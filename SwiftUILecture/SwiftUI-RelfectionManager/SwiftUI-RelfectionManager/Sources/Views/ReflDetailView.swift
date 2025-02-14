//
//  ReflDetailView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct ReflDetailView: View {
    var reflection : Reflection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(reflection.date, style: .date)
                .font(.headline)
            Text(reflection.content)
                .font(.body)
            Spacer()
        } // : vstack
        .padding()
        .navigationTitle("회고 상세")
    }
}

#Preview {
    ReflDetailView(reflection: Reflection(date: Date(), content: "This is a test reflection. is a test reflection.This is a test reflection.This is a test reflection.This is a test reflection.This is a test reflection.This is a test reflection.This is a test reflection.This is a test reflection."))
}
