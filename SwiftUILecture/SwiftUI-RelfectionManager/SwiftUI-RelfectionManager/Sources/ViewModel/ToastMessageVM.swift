//
//  ToastMessageVM.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

@MainActor
class ToastMessageVM: ObservableObject {
    @Published var showToast: Bool = false
    @Published var toastMessage : String = ""
    
    
    func showToastMessage(_ message: String) async {
        toastMessage = message
        showToast = true
        
        await withCheckedContinuation { continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showToast = false
                continuation.resume()
            }
        }
    }
}
