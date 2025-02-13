//
//  AppConstant.swift
//  SwiftUI-Combine-CalculatorEx
//
//  Created by 김도연 on 2/13/25.
//

import Foundation

class AppConstant {
    class UI {}
    class UserDefaultsName {}
}

extension AppConstant.UI {
    static let numberPadSpacing: CGFloat = 15
}

extension AppConstant.UserDefaultsName {
    static let lastCalcValue: String = "lastCalcValue"
}
