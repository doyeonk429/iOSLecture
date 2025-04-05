//
//  FileLogger.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation

enum FileLogger {
    static let logFileURL: URL = {
        let baseDir = FileManager.default.temporaryDirectory

        let logsDirectory = baseDir.appendingPathComponent("Logs/toto-combine", isDirectory: true)
        try? FileManager.default.createDirectory(at: logsDirectory, withIntermediateDirectories: true)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd_HH-mm-ss"
        let timestamp = formatter.string(from: Date())

        return logsDirectory.appendingPathComponent("test-log-\(timestamp).txt")
    }()

    static func log(_ message: String) {
        let timestamp = DateFormatter.localizedString(
            from: Date(),
            dateStyle: .none,
            timeStyle: .medium
        )
        let fullMessage = "[\(timestamp)] \(message)\n"
        guard let data = fullMessage.data(using: .utf8) else { return }

        if FileManager.default.fileExists(atPath: logFileURL.path) {
            if let handle = try? FileHandle(forWritingTo: logFileURL) {
                try? handle.seekToEnd()
                handle.write(data)
                try? handle.close()
            }
        } else {
            try? data.write(to: logFileURL)
        }
    }

}
