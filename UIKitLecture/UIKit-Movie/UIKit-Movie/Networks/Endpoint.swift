//
//  Endpoint.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/3/25.
//

import UIKit
import CombineMoya
import Moya

enum MovieEndpoint {
    case getDailyBoxOffice(date: String)
}

extension MovieEndpoint: TargetType {
    var baseURL: URL {
        return URL(string: Domain.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getDailyBoxOffice:
            return Domain.boxOfficePath
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getDailyBoxOffice(let date):
            return .requestParameters(parameters: [
                "key": Domain.apiKey,
                "targetDt": date
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}
