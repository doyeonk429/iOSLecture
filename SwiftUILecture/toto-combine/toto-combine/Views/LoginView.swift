//
//  LoginView.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("로그인")
                .font(.largeTitle)
                .bold()

            TextField("이메일", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            SecureField("비밀번호", text: $password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            Button("로그인") {
                authVM.signIn(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)

            NavigationLink("회원가입", destination: SignUpView())
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

