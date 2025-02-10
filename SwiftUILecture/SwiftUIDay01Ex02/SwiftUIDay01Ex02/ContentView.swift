//
//  ContentView.swift
//  SwiftUIDay01Ex02
//
//  Created by 김도연 on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    var body: some View {
        VStack{
            Text("요건 텍스트얌\n클릭 수 : \(count)")
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding()
            
            HStack(alignment: .center) {
                CustomButton(title: "카운트 증가") {
                    count += 1
                }
                CustomButton(title: "카운트 감소") {
                    count -= 1
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CustomButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(title, action: action)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
