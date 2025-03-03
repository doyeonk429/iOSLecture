//
//  RankingCell.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/28/25.
//

import UIKit
import SnapKit
import Then
import Combine
import SDWebImage

//class RankingCell: UICollectionViewCell {
//    static let identifier = CellID.rankingCell.rawValue
//    
//    private let posterImageView = UIImageView().then {
//        $0.contentMode = .scaleAspectFit
//        $0.clipsToBounds = true
//        $0.layer.cornerRadius = 10
//    }
//    
//    private let rankingLabel = UILabel().then {
//        $0.font = .boldSystemFont(ofSize: 24)
//        $0.textColor = .white
//        $0.textAlignment = .center
//        $0.backgroundColor = .clear
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
//        [posterImageView, rankingLabel].forEach { contentView.addSubview($0) }
//        
//        posterImageView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//        
//        rankingLabel.snp.makeConstraints {
//            $0.top.leading.equalToSuperview().offset(8)
//            $0.width.height.equalTo(30)
//        }
//    }
//    
//    public func configure(with data: Movie) {
//        titleLabel.text = data.title
//        if let url = URL(string: data.posterImageURL) {
//            posterImageView.sd_setImage(with: url)
//        } else {
//            print("❌ 유효하지 않은 URL: \(data.posterImageURL)")
//        }
//    }
//    
//}
