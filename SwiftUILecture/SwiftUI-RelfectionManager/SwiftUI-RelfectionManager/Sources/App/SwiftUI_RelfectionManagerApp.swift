//
//  SwiftUI_RelfectionManagerApp.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

@main
struct SwiftUI_RelfectionManagerApp: App {
    @StateObject var toastVM = ToastMessageVM()
    @StateObject var reflVM = ReflectionViewModel()
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
                .environmentObject(toastVM)
                .environmentObject(reflVM)
        }
    }
}
