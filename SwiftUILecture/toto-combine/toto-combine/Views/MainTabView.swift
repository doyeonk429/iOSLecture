//
//  MainTabView.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import SwiftUI

enum Tab {
    case home
    case profile
}

struct MainTabView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    MainView()
                case .profile:
                    MyPageView()
                }
            }

            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
