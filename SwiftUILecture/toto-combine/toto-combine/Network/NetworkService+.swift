//
//  NetworkService+.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation
import Combine

extension NetworkService {
    func request<T: Decodable>(_ target: TargetType, responseType: T.Type) async throws -> T {
        let request = try buildRequest(from: target)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                throw NetworkError.requestFailed(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unknown(error)
        }
    }

    func requestPublisher<T: Decodable>(
        _ target: TargetType,
        responseType: T.Type
    ) -> AnyPublisher<T, NetworkError> {
        do {
            let request = try buildRequest(from: target)
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { result in
                    guard let httpResponse = result.response as? HTTPURLResponse,
                          (200..<300).contains(httpResponse.statusCode) else {
                        throw NetworkError.requestFailed(statusCode: (result.response as? HTTPURLResponse)?.statusCode ?? -1)
                    }
                    return result.data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in
                    if let decodingError = error as? DecodingError {
                        return .decodingFailed
                    } else if let networkError = error as? NetworkError {
                        return networkError
                    } else {
                        return .unknown(error)
                    }
                }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.unknown(error))
                .eraseToAnyPublisher()
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
