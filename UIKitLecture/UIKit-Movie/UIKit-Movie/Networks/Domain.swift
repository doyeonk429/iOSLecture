//
//  Domain.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/3/25.
//

import Foundation

struct Domain {
    public static let apiKey = Bundle.main.apiKey
    public static let baseURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/"
    
    public static let boxOfficePath = "boxoffice/searchDailyBoxOfficeList.json"
    
    public static let movieInfoPath = "movie/searchMovieInfo.json"
}
