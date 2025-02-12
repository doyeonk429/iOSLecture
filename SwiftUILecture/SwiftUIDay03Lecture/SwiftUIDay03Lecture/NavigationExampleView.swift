//
//  NavigationExampleView.swift
//  SwiftUIDay03Lecture
//
//  Created by 김도연 on 2/12/25.
//

import SwiftUI

struct NavigationExampleView: View {
    var body: some View {
        NavigationView {
            Spacer()
            VStack {
                Text("여기는 메인 화면입니다.")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: NavigationDesView()) {
                    Text("세부 화면으로 이동하기")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.pink))
                }
            }
            .padding(.horizontal)
            .navigationTitle("메인 화면")
            .navigationBarTitleDisplayMode(.large)
            Spacer()
        }
    }
}

#Preview {
    NavigationExampleView()
}
