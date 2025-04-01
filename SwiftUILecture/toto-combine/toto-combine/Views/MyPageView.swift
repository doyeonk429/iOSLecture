//
//  MyPageView.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Text(authVM.user?.email ?? "알 수 없는 사용자")
                .font(.title3)
                .bold()

            Button("비밀번호 재설정") {
                authVM.resetPassword()
            }
            .buttonStyle(.bordered)
            .tint(.blue)

            Button("로그아웃") {
                authVM.signOut()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            Button("회원 탈퇴") {
                authVM.deleteAccount()
            }
            .buttonStyle(.bordered)
            .tint(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle("마이페이지")
        .alert("알림", isPresented: $authVM.showErrorAlert) {
            Button("확인", role: .cancel) {}
        } message: {
            if let message = authVM.errorMessage {
                Text(message)
            }
        }
    }
}
