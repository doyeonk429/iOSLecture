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
    
    private func request<T: Decodable>(_ target: MovieEndpoint, responseType: T.Type) -> AnyPublisher<T, MoyaError> {
        provider.requestPublisher(target)
            .tryMap { response -> T in
                guard (200...299).contains(response.statusCode) else {
                    throw MoyaError.statusCode(response)
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(T.self, from: response.data)
            }
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
    
    /// 일간 박스오피스
    func fetchDailyBoxOffice(date: String) -> AnyPublisher<[DailyBoxOffice], MoyaError> {
        request(.getDailyBoxOffice(date: date), responseType: BoxOfficeResponse.self)
            .map { $0.boxOfficeResult.dailyBoxOfficeList }
            .eraseToAnyPublisher()
    }
    
    /// 상세 영화 정보
    func fetchMovieDetail(movieId: String) -> AnyPublisher<MovieInfo, MoyaError> {
        request(.getMovieDetail(movieId: movieId), responseType: MovieDetailResponse.self)
            .map { $0.movieInfoResult.movieInfo }
            .eraseToAnyPublisher()
    }
}
