//
//  NetworkService.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation
import Combine

protocol NetworkService {
    func request<T: Decodable>(_ target: TargetType, responseType: T.Type) async throws -> T
    func requestPublisher<T: Decodable>(_ target: TargetType, responseType: T.Type) -> AnyPublisher<T, NetworkError>
}
