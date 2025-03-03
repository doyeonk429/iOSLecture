//
//  MovieDetailDTO.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/3/25.
//

import Foundation

// 최상위 응답 구조
struct MovieDetailResponse: Codable {
    let movieInfoResult: MovieInfoResult
}

// 영화 상세 정보 구조
struct MovieInfoResult: Codable {
    let movieInfo: MovieInfo
}

// 실제 필요한 영화 정보만 포함한 구조체
struct MovieInfo: Codable {
    let movieCd: String
    let movieNm: String
    let showTm: String
    let openDt: String
    let typeNm: String
    let genres: [Genre]
    let directors: [Director]
    let actors: [Actor]
    
    // ✅ 필요한 부분만 디코딩
    enum CodingKeys: String, CodingKey {
        case movieCd, movieNm, showTm, openDt, typeNm, genres, directors, actors
    }
}

// 장르 정보
struct Genre: Codable {
    let genreNm: String
}

// 감독 정보 (1명만 디코딩)
struct Director: Codable {
    let peopleNm: String
}

// 배우 정보 (최대 5명만 디코딩)
struct Actor: Codable {
    let peopleNm: String
    let cast: String?
}

// ✅ 필요한 데이터만 가져오는 커스텀 디코딩 전략
extension MovieInfo {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.movieCd = try container.decode(String.self, forKey: .movieCd)
        self.movieNm = try container.decode(String.self, forKey: .movieNm)
        self.showTm = try container.decode(String.self, forKey: .showTm)
        self.openDt = try container.decode(String.self, forKey: .openDt)
        self.typeNm = try container.decode(String.self, forKey: .typeNm)
        
        self.genres = try container.decode([Genre].self, forKey: .genres)
        
        // ✅ 첫 번째 감독만 가져오기
        let allDirectors = try container.decode([Director].self, forKey: .directors)
        self.directors = allDirectors.prefix(1).map { $0 }
        
        // ✅ 최대 5명의 배우만 가져오기
        let allActors = try container.decode([Actor].self, forKey: .actors)
        self.actors = allActors.prefix(5).map { $0 }
    }
}
