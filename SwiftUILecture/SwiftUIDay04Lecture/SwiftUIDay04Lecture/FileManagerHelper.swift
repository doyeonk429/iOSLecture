//
//  FileManagerHelper.swift
//  SwiftUIDay04Lecture
//
//  Created by 김도연 on 2/13/25.
//

import SwiftUI

// VO, DTO 또는 자바의 Bean
// 다른 뷰 파일에서도 접근 가능한 전역 선억
struct UserDTO: Codable {
    var id: UUID
    var name: String
    var age: Int
}

// 데이터를 저장하고 불러오는 역할
// 외부에서 데이터를 변경 해야 하기때문에 참조형으로 선언
class FileManagerHelper {
    // 싱글톤: 이 클래스의 객체는 오직 하나뿐이다.
    // FileManagerHelper.shared.멤버
    static let shared = FileManagerHelper()
    // 저장 할 파일 이름
    private let fileName = "user.json"

    // JSON 파일로 저장하기
    func saveUsers(_ users: [UserDTO]) {
        
        return
    }


    // JSON 문자열을 배열로 불러오기
    func loadUsers() -> [UserDTO] {
        
        return
    }
}
