//
//  main.swift
//  SwiftEx02
//
//  Created by 김도연 on 2/5/25.
//

import Foundation

print(":::: 전화 번호부 ::::")
let phoneBook = PhoneBook()

while (true) {
    phoneBook.printMenu()
    
    let userInput = Int(readLine() ?? "") ?? -1
    
    print()
    
    switch userInput {
    case 1:
        phoneBook.input()
    case 2:
        phoneBook.output()
    case 3:
        phoneBook.search()
    case 4:
        phoneBook.delete()
    case 5:
        phoneBook.edit()
    case 6:
        phoneBook.quit()
        break
    default:
        print("잘못된 선택입니다.\n다시 시도해주세요.")
    }
}
