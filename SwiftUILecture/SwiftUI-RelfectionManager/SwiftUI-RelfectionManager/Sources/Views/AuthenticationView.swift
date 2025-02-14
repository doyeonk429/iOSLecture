//
//  AuthenticationView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject private var authVM = BiometricAuthVM()
    @EnvironmentObject var toastVM: ToastMessageVM
    @EnvironmentObject var reflVM: ReflectionViewModel
    
    @AppStorage(Constants.UserDefaultsKey.appLockKey) private var isLockEnabled: Bool = false
    
    var body: some View {
        VStack {
            if isLockEnabled {
                if authVM.isAuth {
                    MainTabView()
                } else {
                    LockedView(authVM: authVM)
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
        .environmentObject(ToastMessageVM())
        .environmentObject(ReflectionViewModel())
}
