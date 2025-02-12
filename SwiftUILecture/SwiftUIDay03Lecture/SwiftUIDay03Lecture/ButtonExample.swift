//
//  ContentView.swift
//  SwiftUIDay03Lecture
//
//  Created by 김도연 on 2/12/25.
//

import SwiftUI

struct ButtonExample: View {
    @State var message = "아무 일도 일어나지 않았습니다... 아직은"
    var body: some View {
        VStack(spacing: 10) {
            Text(message)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(.black)
            HStack(spacing: 30) {
                Button {
                    message = "버튼이 클릭되었습니다."
                } label: {
                    Text("눌러보세요")
                        .font(.headline)
                        .frame(minWidth: 100, minHeight: 50)
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                }
                
                Button {
                    message = "메세지가 초기화되었습니다."
                } label: {
                    Text("초기화")
                        .font(.headline)
                        .frame(minWidth: 100, minHeight: 50)
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ButtonExample()
}
