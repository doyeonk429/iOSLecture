//
//  Post.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation

struct Post: Codable, Identifiable, Equatable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

struct EmptyResponse: Decodable, Equatable {}
