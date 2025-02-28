//
//  HomeViewController.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/27/25.
//

import UIKit
import SnapKit
import Then
import Combine

class HomeViewController: UIViewController {
    //MARK: - property
    internal var collectionView: UICollectionView!
    internal var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        applySnapshot()
    }

}

extension HomeViewController {
    enum Section: CaseIterable {
        case popularMovies  // 인기 영화
        case genreMovies    // 장르별 영화
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedMovie = dataSource.itemIdentifier(for: indexPath) else { return }
        
        let detailVC = MovieDetailViewController(movie: selectedMovie)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
