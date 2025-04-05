//
//  LoggingNetworkService.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation
import Combine
import os

final class LoggingNetworkService: NetworkService {
    private let wrapped: NetworkService
    private let logger = Logger(subsystem: "com.toto.combine", category: "Network")
    private let enableFileLogging: Bool
    
    init(wrapped: NetworkService, enableFileLogging: Bool = true) {
        self.wrapped = wrapped
        self.enableFileLogging = enableFileLogging
    }
    
    private func logToFile(_ message: String) {
        if enableFileLogging {
            FileLogger.log(message)
        }
    }
    
    func request<T: Decodable>(
        _ target: TargetType,
        responseType: T.Type
    ) async throws -> T {
        let url = target.baseURL.appendingPathComponent(target.path)
        
        let requestLog = "🌐 [REQUEST] \(target.method.rawValue) \(url)"
        logger.info("\(requestLog, privacy: .public)")
        logToFile(requestLog)
        
        if let headers = target.headers {
            let headerLog = "🔐 [HEADERS] \(headers)"
            logger.debug("\(headerLog, privacy: .public)")
            logToFile(headerLog)
        }
        
        switch target.task {
        case .plain:
            logToFile("📦 [TASK] plain")
        case .parameters(let params):
            logToFile("📦 [PARAMETERS] \(params)")
        case .encodable:
            logToFile("📦 [ENCODABLE] (not printed)")
        }
        
        let start = Date()
        
        do {
            let result = try await wrapped.request(target, responseType: T.self)
            let duration = Date().timeIntervalSince(start) * 1000
            let successLog = "✅ [RESPONSE] \(T.self) decoded in \(String(format: "%.1f", duration))ms"
            logger.info("\(successLog)")
            logToFile(successLog)
            return result
        } catch {
            let duration = Date().timeIntervalSince(start) * 1000
            let errorLog = "❌ [ERROR] \(error.localizedDescription) (\(String(format: "%.1f", duration))ms)"
            logger.error("\(errorLog, privacy: .public)")
            logToFile(errorLog)
            throw error
        }
    }
    
    func requestPublisher<T: Decodable>(
        _ target: TargetType,
        responseType: T.Type
    ) -> AnyPublisher<T, NetworkError> {
        let url = target.baseURL.appendingPathComponent(target.path)
        let logMessage = "🌐 [REQUEST (Publisher)] \(target.method.rawValue) \(url)"

        logger.info("\(logMessage, privacy: .public)")
        logToFile(logMessage)

        return wrapped.requestPublisher(target, responseType: responseType)
    }
}
