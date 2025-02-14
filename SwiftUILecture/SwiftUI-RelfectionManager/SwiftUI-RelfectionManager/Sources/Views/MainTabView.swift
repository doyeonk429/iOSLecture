//
//  MainTabView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .tint(.green)
    }
}

#Preview {
    MainTabView()
}
