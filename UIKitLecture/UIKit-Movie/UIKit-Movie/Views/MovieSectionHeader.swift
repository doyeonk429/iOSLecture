//
//  MovieSectionHeader.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/28/25.
//

import UIKit
import SnapKit
import Then

enum ViewID : String {
    case MovieSectionHeader = "MovieSectionHeader"
}

class MovieSectionHeader: UICollectionReusableView {
    static let identifier = ViewID.MovieSectionHeader.rawValue

    private let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .label
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.backgroundColor = .green
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }

    func configure(with title: String) {
        titleLabel.text = title
    }
    
}
