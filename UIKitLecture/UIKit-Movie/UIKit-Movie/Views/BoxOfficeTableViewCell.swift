//
//  BoxOfficeTableViewCell.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/4/25.
//

import UIKit
import SnapKit
import Then

final class BoxOfficeTableViewCell: UITableViewCell {
    
    private let rankLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    private let rankChangeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .center
    }
    
    private let movieTitleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let openDateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .darkGray
    }
    
    private let rankStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 4
    }
    
    private let movieStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 8
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        selectionStyle = .none
        
        rankStackView.addArrangedSubview(rankLabel)
        rankStackView.addArrangedSubview(rankChangeLabel)
        
        movieStackView.addArrangedSubview(movieTitleLabel)
        movieStackView.addArrangedSubview(openDateLabel)
        
        contentView.addSubview(rankStackView)
        contentView.addSubview(movieStackView)
        
        rankStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(50)
        }
        
        movieStackView.snp.makeConstraints { make in
            make.leading.equalTo(rankStackView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Configure Cell
    func configure(with movie: DailyBoxOffice) {
        rankLabel.text = movie.rank
        movieTitleLabel.text = movie.movieNm
        openDateLabel.text = movie.openDt.toFormattedDate()

        let rankInten = Int(movie.rankInten) ?? 0
        if rankInten > 0 {
            rankChangeLabel.text = "▲ \(rankInten)"
            rankChangeLabel.textColor = .systemGreen
        } else if rankInten < 0 {
            rankChangeLabel.text = "▼ \(-rankInten)"
            rankChangeLabel.textColor = .systemRed
        } else {
            rankChangeLabel.text = "-"
            rankChangeLabel.textColor = .gray
        }
    }
}
