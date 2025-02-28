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
    
    static let genreMovies: [Movie] = [
        Movie(id: 9, title: "Inception", posterImageURL: "https://newsimg.sedaily.com/2020/01/03/1YXI57X1TM_1.jpg"),
        Movie(id: 10, title: "Avengers: Endgame", posterImageURL: "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg"),
        Movie(id: 11, title: "The Matrix", posterImageURL: "https://i.namu.wiki/i/5DuZBygj54Xy6L7JO6l1edR9l4nsfnx6xfViTgsCQq3MMFG9Vwo_Qb-1XY9LwXi-sZmO3wvd3eyIbD2C8OJyXw.webp"),
        Movie(id: 12, title: "Mad Max: Fury Road", posterImageURL: "https://i.ebayimg.com/00/s/NzU1WDUwOQ==/z/2BQAAOSwQJhUkhhG/$_57.JPG?set_id=880000500F"),
        Movie(id: 13, title: "Inception2", posterImageURL: "https://newsimg.sedaily.com/2020/01/03/1YXI57X1TM_1.jpg"),
        Movie(id: 14, title: "Avengers3: Endgame", posterImageURL: "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg"),
        Movie(id: 15, title: "The Matrix2", posterImageURL: "https://i.namu.wiki/i/5DuZBygj54Xy6L7JO6l1edR9l4nsfnx6xfViTgsCQq3MMFG9Vwo_Qb-1XY9LwXi-sZmO3wvd3eyIbD2C8OJyXw.webp"),
        Movie(id: 16, title: "Mad Max2: Fury Road", posterImageURL: "https://i.ebayimg.com/00/s/NzU1WDUwOQ==/z/2BQAAOSwQJhUkhhG/$_57.JPG?set_id=880000500F")
    ]
}
