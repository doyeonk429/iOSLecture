//
//  Note.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import Foundation
import FirebaseFirestore

struct Note: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
    var title: String
    var content: String
    var thumbnailURL: URL
    var createdAt: Date
    var ownerUID: String

    enum CodingKeys: String, CodingKey {
        case title, content, thumbnailURL, createdAt, ownerUID
    }
}
