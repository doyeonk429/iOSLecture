//
//  SignUpView.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.dismiss) var dismiss  // 뒤로 가기

    var body: some View {
        VStack(spacing: 16) {
            Text("회원가입")
                .font(.largeTitle)
                .bold()

            TextField("이메일", text: $email)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            SecureField("비밀번호", text: $password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            Button("회원가입") {
                authVM.signUp(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert("에러", isPresented: $authVM.showErrorAlert, actions: {
            Button("확인", role: .cancel) { }
        }, message: {
            if let message = authVM.errorMessage {
                Text(message)
            }
        })
    }
}
