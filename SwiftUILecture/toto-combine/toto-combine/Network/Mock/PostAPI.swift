//
//  PostAPI.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation

enum PostAPI {
    case getPosts
    case getPost(id: Int)
    case createPost(title: String, body: String, userId: Int)
    case updatePost(id: Int, title: String, body: String, userId: Int)
    case patchPost(id: Int, title: String?)
    case deletePost(id: Int)
}

extension PostAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }

    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case .getPost(let id),
             .updatePost(let id, _, _, _),
             .patchPost(let id, _),
             .deletePost(let id):
            return "/posts/\(id)"
        case .createPost:
            return "/posts"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getPosts, .getPost: return .get
        case .createPost: return .post
        case .updatePost: return .put
        case .patchPost: return .patch
        case .deletePost: return .delete
        }
    }

    var task: RequestTask {
        switch self {
        case .getPosts, .getPost, .deletePost:
            return .plain

        case .createPost(let title, let body, let userId),
             .updatePost(_, let title, let body, let userId):
            return .parameters([
                "title": title,
                "body": body,
                "userId": userId
            ])

        case .patchPost(_, let title):
            var body: [String: Any] = [:]
            if let title = title {
                body["title"] = title
            }
            return .parameters(body)
        }
    }

    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
