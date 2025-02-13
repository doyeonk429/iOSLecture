//
//  WrapperUsingView.swift
//  SwiftUIDay04Lecture
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

struct WrapperUsingView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("userAge") private var userAge: String = ""
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

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
                    Button("데이터 초기화") {
                        resetData()
                    }
                }
            }
            .navigationTitle("UserDefaults 실습")
        }
    }

    // 데이터 초기화 함수
    func resetData() {
        userName = ""
        userAge = ""
        isDarkMode = false
        print("데이터 초기화 완료")
    }
}

#Preview {
    WrapperUsingView()
}

