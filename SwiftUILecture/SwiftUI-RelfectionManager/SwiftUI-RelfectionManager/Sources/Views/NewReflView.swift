//
//  NewReflView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct NewReflView: View {
    @State private var content : String = ""
    @EnvironmentObject var toastVM: ToastMessageVM
    @EnvironmentObject var reflVM: ReflectionViewModel
    @Environment(\.dismiss) private var dismiss
    
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
                reflVM.reflections.append(newRefl)
                
                Task {
                    let isSuccess = reflVM.saveReflections()
                    
                    if isSuccess {
                        await toastVM.showToastMessage("회고 저장 성공")
                        dismiss()
                    } else {
                        await toastVM.showToastMessage("회고 저장 실패")
                    }
                }
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
        .overlay {
            Group {
                if toastVM.showToast {
                    ToastView(message: toastVM.toastMessage)
                }
            }
        }
    }
}

#Preview {
    NewReflView()
        .environmentObject(ToastMessageVM())
}
