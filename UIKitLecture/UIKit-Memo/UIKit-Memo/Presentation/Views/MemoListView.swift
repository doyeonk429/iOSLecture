//
//  MemoListView.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import UIKit
import SnapKit
import Then

final class MemoListView: UIView {
    let tableView = UITableView().then {
        $0.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
    }

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let itemsPerRow: CGFloat = 3
        let spacing: CGFloat = layout.minimumInteritemSpacing * (itemsPerRow - 1)
        let totalPadding: CGFloat = 16 * 2
        let itemWidth = (UIScreen.main.bounds.width - spacing - totalPadding) / itemsPerRow
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        $0.collectionViewLayout = layout
        
        $0.register(MemoCollectionViewCell.self, forCellWithReuseIdentifier: MemoCollectionViewCell.identifier)
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubviews(tableView, collectionView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func toggleView(isCollectionView: Bool) {
        tableView.isHidden = isCollectionView
        collectionView.isHidden = !isCollectionView
    }

}
