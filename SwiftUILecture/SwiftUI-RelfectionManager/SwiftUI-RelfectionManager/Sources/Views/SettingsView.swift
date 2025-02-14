//
//  SettingsView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("알림 권한 요청") {
                NotificationManager.shared.requestPermission()
            }
            .padding()
            .frame(width: 200)
            .background(.appLime)
            .foregroundColor(.black)
            .cornerRadius(10)
            
            Button("알림 설정") {
                NotificationManager.shared.scheduleDailyReflectionReminder()
            }
            .padding()
            .frame(width: 200)
            .background(Color.green)
            .foregroundColor(.black)
            .cornerRadius(10)
        } // : vstack
        .padding()
    }
}

#Preview {
    SettingsView()
}
