//
//  ContentView.swift
//  SwiftUIDay04Lecture
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    @State private var userAge: String = ""
    @State private var isDarkMode: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("사용자 정보 입력")) {
                    TextField("이름 입력", text: $userName)

                    TextField("나이 입력", text: $userAge)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("다크 모드 설정")) {
                    Toggle("다크 모드 활성화", isOn: $isDarkMode)
                }

                Section {
                    Button("저장하기") {
                        saveData()
                    }
                    Button("데이터 불러오기") {
                        loadData()
                    }
                }
            }
            .navigationTitle("UserDefaults 실습")
        }
    }

    // 데이터 저장 함수
    func saveData() {
        UserDefaults.standard.set(userName, forKey: "userName")
        if let age = Int(userAge) {
            UserDefaults.standard.set(age, forKey: "userAge")
        }
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        print("데이터 저장 완료")
    }

    // 데이터 불러오기 함수
    func loadData() {
        userName = UserDefaults.standard.string(forKey: "userName") ?? "Unknown"
        userAge = "\(UserDefaults.standard.integer(forKey: "userAge"))"
        isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        print("데이터 불러오기 완료")
    }
}

#Preview {
    ContentView()
}
