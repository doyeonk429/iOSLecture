//
//  MovieDetailView.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/4/25.
//

import UIKit
import SnapKit
import Then

final class MovieDetailView: UIView {
    
    // MARK: - UI Components
    private let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private let infoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .darkGray
    }
    
    private let genreLabel = UILabel().then {
        $0.font = .italicSystemFont(ofSize: 18)
        $0.textColor = .systemBlue
        $0.textAlignment = .center
    }
    
    private let directorLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .label
    }
    
    private let actorLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .secondaryLabel
        $0.numberOfLines = 0
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        [titleLabel, infoLabel, genreLabel, directorLabel, actorLabel].forEach { addSubview($0) }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        directorLabel.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        actorLabel.snp.makeConstraints { make in
            make.top.equalTo(directorLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Configure with Data
    func configure(with movie: MovieInfo) {
        titleLabel.text = movie.movieNm
        infoLabel.text = "상영시간: \(movie.showTm)분 | 개봉일: \(movie.openDt.toFormattedDate())"
        genreLabel.text = movie.genres.map { $0.genreNm }.joined(separator: ", ")
        directorLabel.text = "감독: \(movie.directors.first?.peopleNm ?? "정보 없음")"
        
        let actorNames = movie.actors.map { $0.peopleNm }
        actorLabel.text = "출연: " + (actorNames.isEmpty ? "정보 없음" : actorNames.joined(separator: ", "))
    }
}
