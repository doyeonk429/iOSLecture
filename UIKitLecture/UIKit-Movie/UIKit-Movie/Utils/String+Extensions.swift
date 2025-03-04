//
//  String+Extensions.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/4/25.
//

import Foundation

extension String {
    func toFormattedDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyyMMdd" // 기존 포맷

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd" // 변경할 포맷

        guard let date = inputFormatter.date(from: self) else { return self }
        return outputFormatter.string(from: date)
    }
}
