//
//  DateFormatter+Extensions.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/4/25.
//

import UIKit

extension DateFormatter {
    static let customFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
}
