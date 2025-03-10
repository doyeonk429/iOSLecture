//
//  MemoTableViewCell.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import UIKit
import SnapKit
import Then
import SDWebImage

final class MemoTableViewCell: UITableViewCell {
    static let identifier = "MemoTableViewCell"
    
    private let thumbnailImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let previewLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.numberOfLines = 1
    }
    
    private let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        [thumbnailImageView, previewLabel, timeLabel].forEach {
            contentView.addSubview($0)
        }

        thumbnailImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.bottom.equalToSuperview().inset(8)
            make.width.equalTo(thumbnailImageView.snp.height)
        }

        previewLabel.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(8)
        }

        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(previewLabel)
            make.top.equalTo(previewLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func configure(thumbnailURL: String, previewText: String, time: String) {
        thumbnailImageView.sd_setImage(with: URL(string: thumbnailURL))
        previewLabel.text = previewText
        timeLabel.text = time
    }

}
