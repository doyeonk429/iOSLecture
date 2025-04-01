//
//  Note.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import Foundation

struct Note: Identifiable, Hashable {
    var id: String
    var title: String
    var content: String
    var thumbnailURL: URL
    var createdAt: Date
}
