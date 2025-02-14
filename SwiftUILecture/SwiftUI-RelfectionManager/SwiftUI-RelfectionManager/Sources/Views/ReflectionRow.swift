//
//  ReflectionRow.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct ReflectionRow: View {
    let reflection: Reflection

    var body: some View {
        VStack(alignment: .leading) {
            Text(reflection.date, style: .date)
                .font(.headline)
            Text(reflection.content)
                .font(.subheadline)
                .lineLimit(1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ReflectionRow(reflection: Reflection(date: Date(), content: "test"))
}
