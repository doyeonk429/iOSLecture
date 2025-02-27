//
//  Double+Extensions.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/27/25.
//

import Foundation

extension Double {
    var formattedString: String {
        let decimalPlaces = self < 1 ? 6 : 2
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = decimalPlaces
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
