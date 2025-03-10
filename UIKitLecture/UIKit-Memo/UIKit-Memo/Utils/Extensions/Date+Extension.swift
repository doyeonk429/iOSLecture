//
//  Date+Extension.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import Foundation

extension Date {
    /// "yyyy년 MM월 dd일 a hh시 mm분" 형식으로 변환
    func toKoreanFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분"
        return formatter.string(from: self)
    }
}
