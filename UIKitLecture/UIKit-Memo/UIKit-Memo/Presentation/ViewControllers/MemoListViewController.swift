//
//  MemoListViewController.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import UIKit

final class MemoListViewController: UIViewController {
    private let memoListView = MemoListView()
    private var isCollectionView = false {
        didSet {
            memoListView.toggleView(isCollectionView: isCollectionView)
            updateToggleButtonImage()
        }
    }
    
    private lazy var toggleViewButton = UIBarButtonItem(
        image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(toggleView)
    )

    private lazy var addMemoButton = UIBarButtonItem(
        barButtonSystemItem: .add, target: self, action: #selector(addMemo)
    )

    override func loadView() {
        view = memoListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }

    private func setupNavigation() {
        title = "메모"
        navigationItem.leftBarButtonItem = toggleViewButton
        navigationItem.rightBarButtonItem = addMemoButton
    }

    @objc private func toggleView() {
        isCollectionView.toggle()
    }
    
    private func updateToggleButtonImage() {
        let imageName = isCollectionView ? "square.grid.2x2" : "list.bullet"
        toggleViewButton.image = UIImage(systemName: imageName)
    }

    @objc private func addMemo() {
        let editVC = MemoEditViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }
    
}
