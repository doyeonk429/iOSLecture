//
//  NetworkService.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(_ target: TargetType, responseType: T.Type) async throws -> T
}

final class DefaultNetworkService: NetworkService {
    func request<T: Decodable>(_ target: TargetType, responseType: T.Type) async throws -> T {
        let request = try buildRequest(from: target)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.requestFailed(statusCode: -1)
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                throw NetworkError.requestFailed(statusCode: httpResponse.statusCode)
            }
            
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingFailed
            }
            
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unknown(error) // 모든 알 수 없는 에러는 unknown으로 감싸기
        }
    }

    private func buildRequest(from target: TargetType) throws -> URLRequest {
        guard let url = URL(string: target.baseURL.absoluteString + target.path) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        target.headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        switch target.task {
        case .plain:
            break
        case .parameters(let params):
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        case .encodable(let encodable):
            request.httpBody = try JSONEncoder().encode(encodable)
        }

        return request
    }
}
