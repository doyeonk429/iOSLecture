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
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(reflection.content)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
            Spacer()
        } // : vstack
        .padding()
        .navigationTitle("회고 상세")
    }
}

#Preview {
    ReflDetailView(reflection: Reflection(date: Date(), content: "text"))
}
