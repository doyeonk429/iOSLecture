//
//  NewReflView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct NewReflView: View {
    @State private var content : String = ""
    @EnvironmentObject var vm : ReflectionViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("회고 작성")
                    .font(.system(size: 20))
                    .padding(.leading, 16)
                TextEditor(text: $content)
                    .frame(height: 300)
                    .border(.green)
            }
            .padding()
            Button {
                // action
                let newRefl = Reflection(date: Date(), content: content)
                vm.reflections.append(newRefl)
                vm.saveReflections()
                
                // 내용 초기화
                content = ""
            } label: {
                // label
                Text("회고 저장하기")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.black)
                    .frame(width: 180, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.appLime)
                    )
            }
        } // : vstack
        .padding()
    }
}

#Preview {
    NewReflView()
}
