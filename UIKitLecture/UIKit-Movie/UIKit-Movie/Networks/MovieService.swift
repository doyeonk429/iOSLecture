//
//  MovieService.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/3/25.
//

import UIKit
import CombineMoya
import Moya
import Combine

final class MovieService {
    static let shared = MovieService()
    
    private let provider: MoyaProvider<MovieEndpoint>
    
    private init() {
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        ]
        provider = MoyaProvider<MovieEndpoint>(plugins: plugins)
    }
    
    func fetchDailyBoxOffice(date: String) -> AnyPublisher<[DailyBoxOffice], MoyaError> {
        provider.requestPublisher(.getDailyBoxOffice(date: date))
            .tryMap { response -> BoxOfficeResponse in
                guard (200...299).contains(response.statusCode) else {
                    throw MoyaError.statusCode(response)
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(BoxOfficeResponse.self, from: response.data)
            }
            .map { $0.boxOfficeResult.dailyBoxOfficeList }
            .mapError { error -> MoyaError in
                if let moyaError = error as? MoyaError {
                    return moyaError
                } else if let decodingError = error as? DecodingError {
                    print("❌ [Decoding Error]: \(decodingError)")
                    return MoyaError.underlying(decodingError, nil)
                }
                return MoyaError.underlying(error, nil)
            }
            .eraseToAnyPublisher()
    }
}
