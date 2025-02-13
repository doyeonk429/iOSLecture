//
//  UserViewModel.swift
//  SwiftUIDay04Lecture
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("userAge") var userAge: String = ""
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    // 사용자 정보 가져오기
    func getUser() -> User {
        return User(name: userName, age: userAge, isDarkMode: isDarkMode)
    }

    // 사용자 정보 업데이트
    func updateUser(name: String, age: String, isDarkMode: Bool) {
        self.userName = name
        self.userAge = age
        self.isDarkMode = isDarkMode
    }

    // 데이터 초기화
    func resetUser() {
        self.userName = ""
        self.userAge = ""
        self.isDarkMode = false
    }
    
    func applyTheme(_ colorScheme: inout ColorScheme?) {
        colorScheme = isDarkMode ? .dark : .light
    }
    
    func toggleDarkMode(_ colorScheme: inout ColorScheme?) {
        isDarkMode.toggle()
        applyTheme(&colorScheme)
    }
}
