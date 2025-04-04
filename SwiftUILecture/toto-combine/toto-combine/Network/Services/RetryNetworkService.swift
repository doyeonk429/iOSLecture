//
//  RetryNetworkService.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation
import Combine

final class RetryNetworkService: NetworkService {
    private let wrapped: NetworkService
    private let maxRetries: Int
    private let retryDelay: UInt64 // nanoseconds (e.g., 0.5초 = 500_000_000)

    init(
        wrapped: NetworkService,
        maxRetries: Int = 3,
        retryDelay: UInt64 = 500_000_000
    ) {
        self.wrapped = wrapped
        self.maxRetries = maxRetries
        self.retryDelay = retryDelay
    }

    // MARK: - async/await 버전
    func request<T: Decodable>(
        _ target: TargetType,
        responseType: T.Type
    ) async throws -> T {
        var attempt = 0
        var lastError: Error?

        while attempt < maxRetries {
            do {
                return try await wrapped.request(target, responseType: responseType)
            } catch let error as NetworkError {
                switch error {
                case .invalidURL,
                     .decodingFailed:
                    throw error
                case .requestFailed(let code) where (400..<500).contains(code):
                    throw error
                default:
                    lastError = error
                    attempt += 1
                    print("🔁 Retry \(attempt)/\(maxRetries) for \(target.path)")
                    try await Task.sleep(nanoseconds: retryDelay)
                }
            } catch {
                throw error
            }
        }

        throw lastError ?? NetworkError.unknown(NSError(domain: "", code: -1))
    }

    // MARK: - Combine 버전
    func requestPublisher<T: Decodable>(
        _ target: TargetType,
        responseType: T.Type
    ) -> AnyPublisher<T, NetworkError> {
        wrapped.requestPublisher(target, responseType: responseType)
            .retryIf(maxRetries: maxRetries, delay: retryDelay / 1_000_000_000) { error in
                // 재시도 여부 분기 로직
                switch error {
                case .invalidURL, .decodingFailed:
                    return false
                case .requestFailed(let code) where (400..<500).contains(code):
                    return false
                default:
                    return true
                }
            }
            .eraseToAnyPublisher()
    }
}
