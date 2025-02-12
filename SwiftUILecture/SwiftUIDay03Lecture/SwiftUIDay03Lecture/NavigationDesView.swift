//
//  NavigationDesView.swift
//  SwiftUIDay03Lecture
//
//  Created by 김도연 on 2/12/25.
//

import SwiftUI

struct NavigationDesView: View {
    var body: some View {
        VStack {
            Text("여기는 세부 화면입니다.")
                .font(.title)
                .padding()
        }
        .navigationTitle("세부 화면")
    }
}

#Preview {
    NavigationDesView()
}
