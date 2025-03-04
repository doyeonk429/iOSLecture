//
//  Bundle+Extensions.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/4/25.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let key = object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("❌ API_KEY가 Info.plist에서 설정되지 않았습니다.")
        }
        return key
    }
}
