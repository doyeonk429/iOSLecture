//
//  MovieCell.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/28/25.
//

import UIKit
import SnapKit
import Then
import Combine
import SDWebImage

enum CellID : String {
    case movieCell = "MovieCell"
    case rankingCell = "RankingCell"
}

//class MovieCell: UICollectionViewCell {
//    static let identifier = CellID.movieCell.rawValue
//    
//    private let posterImageView = UIImageView().then {
//        $0.contentMode = .scaleAspectFit
//        $0.clipsToBounds = true
//        $0.layer.cornerRadius = 10
//    }
//    
//    private let titleLabel = UILabel().then {
//        $0.font = .boldSystemFont(ofSize: 14)
//        $0.textAlignment = .center
//        $0.numberOfLines = 2
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupViews() {
//        contentView.backgroundColor = .brown
//        [posterImageView, titleLabel].forEach { contentView.addSubview($0) }
//        
//        posterImageView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(8)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalToSuperview().multipliedBy(0.8)
//        }
//        
//        titleLabel.snp.makeConstraints {
//            $0.top.equalTo(posterImageView.snp.bottom).offset(8)
//            $0.bottom.equalToSuperview().inset(8)
//            $0.leading.trailing.equalToSuperview()
//        }
//    }
//    
//    public func configure(with data: DailyBoxOffice) {
//        titleLabel.text = data.title
//    }
//    
//}
