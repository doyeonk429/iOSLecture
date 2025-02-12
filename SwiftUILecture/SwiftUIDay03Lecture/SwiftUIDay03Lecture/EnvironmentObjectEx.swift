//
//  EnvironmentObjectEx.swift
//  SwiftUIDay03Lecture
//
//  Created by 김도연 on 2/12/25.
//

import SwiftUI

class UserSettings : ObservableObject {
    @Published var userRole: String = "Newbie"
}

struct EnvironmentObjectEx: View {
    @StateObject var settings = UserSettings()
    
    var body: some View {
        EnvironmentObjectChildEx().environmentObject(settings)
        // .environmentObject() 여기에 넣는 변수를
    }
}

struct EnvironmentObjectChildEx: View {
    // @EnvironmentObject 이걸로 받는 것
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Text("당신의 등급은 \(settings.userRole)입니다.")
    }
}

#Preview {
    EnvironmentObjectEx()
}
