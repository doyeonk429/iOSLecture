//
//  NetworkError.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "잘못된 URL입니다."
        case .requestFailed(let statusCode):
            return "요청 실패: 상태 코드 \(statusCode)"
        case .decodingFailed:
            return "데이터 파싱에 실패했습니다."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
