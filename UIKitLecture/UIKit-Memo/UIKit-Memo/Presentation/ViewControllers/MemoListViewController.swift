//
//  MemoListViewController.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import UIKit
import SnapKit
import Combine

final class MemoListViewController: UIViewController {
    private let memoListView = MemoListView()
    private let viewModel = MemoListViewModel()
    private var cancellables = Set<AnyCancellable>()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        bindViewModel()
        setDelegate()
        
        viewModel.input.fetchMemos.send(())
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(memoListView)
        
        memoListView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setupNavigation() {
        title = "메모"
        navigationItem.leftBarButtonItem = toggleViewButton
        navigationItem.rightBarButtonItem = addMemoButton
    }
    
    private func bindViewModel() {
        viewModel.output.memoList
            .sink { [weak self] memos in
                self?.reloadData(memos: memos)
            }
            .store(in: &cancellables)
    }
    
    private func setDelegate() {
        memoListView.tableView.dataSource = self
        memoListView.collectionView.dataSource = self
        memoListView.tableView.delegate = self
        memoListView.collectionView.delegate = self
    }
    
    private func reloadData(memos: [Memo]) {
        memoListView.tableView.reloadData()
        memoListView.collectionView.reloadData()
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

extension MemoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.memoList.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as! MemoTableViewCell
        let memo = viewModel.output.memoList.value[indexPath.row]
        
        cell.configure(thumbnailURL: memo.imageURL, previewText: memo.previewText, time: memo.date.toKoreanFormattedString())
        
        return cell
    }
}

extension MemoListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.output.memoList.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemoCollectionViewCell.identifier, for: indexPath) as! MemoCollectionViewCell
        let memo = viewModel.output.memoList.value[indexPath.item]
        
        cell.configure(thumbnailURL: memo.imageURL)
        
        return cell
    }
}

extension MemoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedMemo = viewModel.output.memoList.value[indexPath.row]
        let editVC = MemoEditViewController(memo: selectedMemo)
        navigationController?.pushViewController(editVC, animated: true)
    }
}

extension MemoListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMemo = viewModel.output.memoList.value[indexPath.item]
        let editVC = MemoEditViewController(memo: selectedMemo)
        navigationController?.pushViewController(editVC, animated: true)
    }
}
