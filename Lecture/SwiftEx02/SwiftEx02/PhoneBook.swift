//
//  PhoneBook.swift
//  SwiftEx02
//
//  Created by 김도연 on 2/5/25.
//

import Foundation

struct PhoneBook {
    func printMenu() {
        print("----- MENU -----")
        print("1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)END")
        print("Choice: ", terminator: "")
    }
    
    func printMenuHeader(_ title: String) {
        print("----- \(title) ----")
    }
}

extension PhoneBook {
    func input() {
        printMenuHeader("입력 기능")
        print()
    }
    
    func output() {
        printMenuHeader("목록 출력 기능")
        print()
    }
    
    func search() {
        printMenuHeader("검색 기능")
        print()
    }
    
    func edit() {
        printMenuHeader("수정 기능")
        print()
    }
    
    func delete() {
        printMenuHeader("삭제 기능")
        print()
    }
    
    func quit() {
        printMenuHeader("프로그램 종료")
        print("수고하셨습니다. 다음 기회에 또 만나요.")
    }
}
