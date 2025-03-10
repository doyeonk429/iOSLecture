//
//  MemoCollectionViewCell.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import UIKit
import SnapKit
import Then
import SDWebImage

final class MemoCollectionViewCell: UICollectionViewCell {
    static let identifier = "MemoCollectionViewCell"
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configure(thumbnailURL: String) {
        imageView.sd_setImage(with: URL(string: thumbnailURL))
    }
}
