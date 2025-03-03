//
//  DummyModels.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/28/25.
//

import Foundation

// ✅ 박스오피스 API 응답 구조
struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

// ✅ 박스오피스 결과 (일별/주간)
struct BoxOfficeResult: Decodable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

// ✅ 필요한 데이터만 포함한 영화 정보
struct DailyBoxOffice: Decodable, Hashable {
    let rank: String           // 현재 랭킹
    let rankInten: String      // 전날 대비 랭킹 변동
    let movieCd: String        // 영화 코드 (고유 ID)
    let movieNm: String        // 영화 이름
    let openDt: String         // 개봉일
}
