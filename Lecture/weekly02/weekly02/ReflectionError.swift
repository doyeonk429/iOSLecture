//
//  ReflectionError.swift
//  Weekly01
//
//  Created by 김도연 on 2/9/25.
//

import Foundation

/// 회고 관련 에러 메시지를 관리하는 열거형
enum ReflectionError: String {
    case invalidDate = "잘못된 날짜 형식입니다. (예: 2025-02-07)"
    case emptyInput = "입력된 값이 없습니다."
    case duplicateEntry = "해당 날짜의 회고가 이미 존재합니다. 수정 기능을 이용하세요."
    case notFound = "해당 날짜의 회고가 없습니다."

    /// 에러 메시지를 출력하는 함수
    func printMessage() {
        print(self.rawValue)
    }
}
