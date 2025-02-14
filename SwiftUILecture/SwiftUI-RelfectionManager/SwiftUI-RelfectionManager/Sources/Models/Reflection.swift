//
//  Reflection.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import Foundation

struct Reflection : Codable, Identifiable {
    var id: UUID = UUID()
    var date: Date
    var content: String
}
