//
//  AuthenticationView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject private var authVM = BiometricAuthVM()
    @AppStorage(Constants.UserDefaultsKey.appLockKey) private var isLockEnabled: Bool = true
    
    var body: some View {
        VStack {
            if isLockEnabled {
                if authVM.isAuth {
                    MainTabView()
                } else {
                    VStack(spacing: 20) {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.gray)
                        
                        Text("Face ID or Touch ID가 필요합니다.")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button {
                            // action
                            authVM.authenticate()
                        } label: {
                            Text("인증하기")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 180, height: 50)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                
            }
            else {
                MainTabView()
            }
        }
        .onAppear {
            authVM.authenticate()
        }
    }
}

#Preview {
    AuthenticationView()
}
