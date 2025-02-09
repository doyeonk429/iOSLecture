//
//  main.swift
//  Weekly01
//
//  Created by 김도연 on 2/7/25.
//

import Foundation

/// 메뉴 출력 함수
func printMenus() {
    print("""
    === 회고 시스템 ===
    1. 회고 추가
    2. 회고 조회
    3. 회고 수정
    4. 회고 삭제
    5. 전체 회고 목록 출력
    6. 종료
    """)
}

/// 사용자 입력 처리 함수
func getUserInput() {
    let manager = ReflectionManager()
    printMenus()

    while true {
        print("메뉴를 입력하세요:", terminator: " ")
        guard let input = Int(readLine() ?? ""), (1...6).contains(input) else {
            print("잘못된 메뉴 선택입니다.")
            continue
        }

        switch input {
        case 1: manager.addReflection()
        case 2: manager.readReflection()
        case 3: manager.updateReflection()
        case 4: manager.deleteReflection()
        case 5: manager.getAllReflections()
        case 6:
            print("프로그램을 종료합니다.")
            return
        default:
            print("잘못된 메뉴 선택입니다.")
        }
    }
}

getUserInput()
