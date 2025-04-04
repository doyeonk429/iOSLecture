//
//  Publisher+.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation
import Combine

extension Publisher {
    func retryIf(
        maxRetries: Int,
        delay: UInt64,
        shouldRetry: @escaping (Failure) -> Bool
    ) -> AnyPublisher<Output, Failure> {
        self.catch { error -> AnyPublisher<Output, Failure> in
            guard maxRetries > 0, shouldRetry(error) else {
                return Fail(error: error).eraseToAnyPublisher()
            }

            return Just(())
                .delay(for: .seconds(Double(delay)), scheduler: DispatchQueue.global())
                .flatMap { _ in
                    self.retryIf(maxRetries: maxRetries - 1, delay: delay, shouldRetry: shouldRetry)
                }
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
