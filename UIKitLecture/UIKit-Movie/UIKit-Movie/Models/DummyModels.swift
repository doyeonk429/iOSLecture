//
//  DummyModels.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/28/25.
//

import Foundation

struct Movie: Hashable {
    let id: Int
    let title: String
    let posterImageURL: String
}

extension Movie {
    static let mockMovies: [Movie] = [
        Movie(id: 1, title: "Interstellar", posterImageURL: "https://upload.wikimedia.org/wikipedia/ko/b/b7/%EC%9D%B8%ED%84%B0%EC%8A%A4%ED%85%94%EB%9D%BC.jpg"),
        Movie(id: 3, title: "Parasite", posterImageURL: "https://upload.wikimedia.org/wikipedia/ko/6/60/%EA%B8%B0%EC%83%9D%EC%B6%A9_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg"),
        Movie(id: 6, title: "The Dark Knight", posterImageURL: "https://i.namu.wiki/i/38zgpL4psWulxyEzEd1YPu_E3_XvhazTLIGEH-MCdAqtH-UQ1dv4Ttr4iS3JA31WTWvO7-Ej1jTTh0Gs4hvwbg.webp"),
        Movie(id: 7, title: "Dune", posterImageURL: "https://i.namu.wiki/i/1ZOJDCSjLBR4E0u7zMvv1puGcSQ_GhvjLnvO4lYOnnVWch8LBNMQKvjislmbYghU4kjS_2E0Kz-_3e7NmiovVw.webp"),
        Movie(id: 8, title: "Oppenheimer", posterImageURL: "https://ojsfile.ohmynews.com/STD_IMG_FILE/2023/1208/IE003237257_STD.jpg")
    ]
}
