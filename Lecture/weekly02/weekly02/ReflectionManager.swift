//
//  ReflectionManager.swift
//  Weekly01
//
//  Created by 김도연 on 2/9/25.
//

import Foundation

/// 회고 관리를 위한 클래스
class ReflectionManager {
    /// 저장된 회고 목록을 관리하는 배열
    private var reflections: [Reflection] = []
    
    //MARK: - Internal Funcs

    /// 입력된 날짜 문자열이 `yyyy-MM-dd` 형식인지 검증하는 함수
    ///
    /// - Parameter date: 사용자가 입력한 날짜 문자열
    /// - Returns: 날짜 형식이 올바르면 `true`, 그렇지 않으면 `false`
    private func isValidDate(_ date: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.date(from: date) != nil
    }
    
    /// 사용자 입력을 받는 함수 (공통 기능)
    ///
    /// - Parameter message: 입력 메시지
    /// - Returns: 입력받은 문자열 (공백일 경우 `nil`)
    private func getUserInput(_ message: String) -> String? {
        print("\(message)", terminator: " ")
        let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
        return input?.isEmpty == true ? nil : input
    }

    
    /// 특정 날짜의 회고 인덱스를 찾는 함수
    ///
    /// - Parameter date: 검색할 날짜
    /// - Returns: 배열 내 인덱스 (없으면 `nil`)
    private func findReflectionIndex(by date: String) -> Int? {
        return reflections.firstIndex(where: { $0.date == date })
    }
    
    //MARK: - Public Funcs
    /// 새로운 회고를 추가하는 함수
    func addReflection() {
        guard let date = getUserInput("날짜를 입력하세요 (예: 2025-02-07):"), isValidDate(date) else {
            ReflectionError.invalidDate.printMessage()
            return
        }

        if findReflectionIndex(by: date) != nil {
            ReflectionError.duplicateEntry.printMessage()
            return
        }

        guard let content = getUserInput("회고 내용을 입력하세요:") else {
            ReflectionError.emptyInput.printMessage()
            return
        }

        reflections.append(Reflection(date: date, content: content))
        print("회고가 추가되었습니다.")
    }

    /// 특정 날짜의 회고를 조회하는 함수
    func readReflection() {
        guard let date = getUserInput("조회할 날짜를 입력하세요:"),
              let reflection = reflections.first(where: { $0.date == date }) else {
            ReflectionError.notFound.printMessage()
            return
        }

        print("날짜: \(reflection.date)\n내용: \(reflection.content)")
    }

    /// 기존 회고를 수정하는 함수
    func updateReflection() {
        guard let date = getUserInput("수정할 날짜를 입력하세요:"),
              let index = findReflectionIndex(by: date) else {
            ReflectionError.notFound.printMessage()
            return
        }

        guard let newContent = getUserInput("새로운 회고 내용을 입력하세요:") else {
            ReflectionError.emptyInput.printMessage()
            return
        }

        reflections[index].content = newContent
        print("회고가 수정되었습니다.")
    }

    /// 특정 날짜의 회고를 삭제하는 함수
    func deleteReflection() {
        guard let date = getUserInput("삭제할 날짜를 입력하세요:"),
              let index = findReflectionIndex(by: date) else {
            ReflectionError.notFound.printMessage()
            return
        }

        reflections.remove(at: index)
        print("회고가 삭제되었습니다.")
    }

    /// 저장된 모든 회고를 출력하는 함수
    func getAllReflections() {
        if reflections.isEmpty {
            print("저장된 회고가 없습니다.")
            return
        }

        print("=== 저장된 회고 목록 ===")
        for reflection in reflections.sorted(by: { $0.date < $1.date }) {
            print("날짜: \(reflection.date)\n내용: \(reflection.content)\n")
        }
    }
}
