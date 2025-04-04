//
//  APIRequest.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation

struct APIRequest: TargetType {
    var baseURL: URL
    var path: String
    var method: HTTPMethod
    var task: Task
    var headers: [String: String]?

    init(
        baseURL: URL = URL(string: "https://jsonplaceholder.typicode.com")!,
        path: String,
        method: HTTPMethod = .get,
        task: Task = .plain,
        headers: [String: String]? = nil
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.task = task
        self.headers = headers
    }
}
