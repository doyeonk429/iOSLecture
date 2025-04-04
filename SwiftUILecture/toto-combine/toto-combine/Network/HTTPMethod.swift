//
//  HTTPMethod.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation

enum HTTPMethod: String {
    case get, post, put, delete, patch
}

enum RequestTask {
    case plain
    case parameters([String: Any])
    case encodable(Encodable)
}

protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: RequestTask { get }
    var headers: [String: String]? { get }
}
