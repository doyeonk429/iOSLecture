//
//  BiometricAuthVM.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI
import LocalAuthentication

class BiometricAuthVM: ObservableObject {
    @Published var isAuth = false
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "회고 목록을 열람하려면 인증이 필요합니다."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { isSuccess, authError in
                DispatchQueue.main.async {
                    if isSuccess {
                        self.isAuth = true
                    } else {
                        self.isAuth = false
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.isAuth = false
            }
        }
    }
}
