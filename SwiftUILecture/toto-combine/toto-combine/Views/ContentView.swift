//
//  ContentView.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        if authVM.user != nil {
            MainTabView()
        } else {
            NavigationStack {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
