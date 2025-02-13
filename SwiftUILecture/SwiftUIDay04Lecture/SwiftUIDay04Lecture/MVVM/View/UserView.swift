//
//  UserView.swift
//  SwiftUIDay04Lecture
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

struct UserView: View {
    @StateObject private var viewModel = UserViewModel() // ✅ ViewModel 생성
    @Environment(\.colorScheme) private var systemColorScheme // ✅ 시스템 다크모드 값 가져오기
    @State private var colorScheme: ColorScheme? // ✅ 다크모드 적용을 위한 상태 값

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("사용자 정보 입력")) {
                    TextField("이름 입력", text: $viewModel.userName)

                    TextField("나이 입력", text: $viewModel.userAge)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("다크 모드 설정")) {
                    Toggle("다크 모드 활성화", isOn: Binding(
                        get: { viewModel.isDarkMode },
                        set: { _ in viewModel.toggleDarkMode(&colorScheme) }
                    ))
                }

                Section {
                    Button("데이터 초기화") {
                        viewModel.resetUser()
                        viewModel.applyTheme(&colorScheme)
                    }
                }
            }
            .navigationTitle("실습 리팩토링 (MVVM)")
        }
        .preferredColorScheme(colorScheme)
        .onAppear {
            viewModel.applyTheme(&colorScheme)
        }
    }
}

#Preview {
    UserView()
}
