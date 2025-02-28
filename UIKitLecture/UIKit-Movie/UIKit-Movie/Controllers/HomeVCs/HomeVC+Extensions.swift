//
//  HomeVC.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/28/25.
//

import UIKit
import SnapKit
import Then
import Combine

extension HomeViewController {
    
    private enum Metric {
        static let collectionViewDefaultSideInset: Double = 16
        static let defaultItemSpacing: Double = 16
        static let defaultLineSpacing: Double = 16
    }
    
    internal func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Home"

        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    internal func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        registerCells()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
        }
        collectionView.delegate = self
        setupDataSource()
    }
    
    private func registerCells() {
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        collectionView.register(MovieSectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: MovieSectionHeader.identifier)
    }
    
    internal func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment in
            let sectionType = Section.allCases[sectionIndex]
            
            switch sectionType {
            case .popularMovies:
                return self.createHorizontalSectionLayout()
            case .genreMovies:
                return self.createGridSectionLayout()
            }
        }
    }
    
    internal func createHorizontalSectionLayout() -> NSCollectionLayoutSection {
        let sideInset = Metric.collectionViewDefaultSideInset
        let itemSpacing: Double = Metric.defaultItemSpacing
        let itemWidth = (UIScreen.main.bounds.width - sideInset*2 - itemSpacing) / 2
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(itemWidth),
            heightDimension: .absolute(itemWidth*1.3)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(itemWidth*1.3)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
        group.interItemSpacing = .fixed(itemSpacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 8, trailing: 0)

        return section
    }
    
    internal func createGridSectionLayout() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )

        let sideInset = Metric.collectionViewDefaultSideInset
        let itemSpacing: Double = Metric.defaultItemSpacing
        let itemWidth = (UIScreen.main.bounds.width - 32 - sideInset * 2 - itemSpacing * 2) / 3

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(itemWidth),
            heightDimension: .absolute(itemWidth*1.8)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(itemWidth*1.8)
        )

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(itemSpacing)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = Metric.defaultLineSpacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: sideInset, bottom: 0, trailing: sideInset)

        section.boundarySupplementaryItems = [header]

        return section
    }
}

extension HomeViewController {
    internal func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Movie>(collectionView: collectionView, cellProvider: { collectionView, indexPath, movie in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell
            cell?.configure(with: movie)

            return cell
        })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else { return nil }
            
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: MovieSectionHeader.identifier,
                for: indexPath
            ) as? MovieSectionHeader
            
            let section = Section.allCases[indexPath.section]
            let title = (section == .genreMovies) ? "🎭 장르별 영화" : ""
            headerView?.configure(with: title)
            
            return headerView
        }
    }
    
    internal func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.popularMovies, .genreMovies])
        snapshot.appendItems(Movie.mockMovies, toSection: .popularMovies)
        snapshot.appendItems(Movie.genreMovies, toSection: .genreMovies)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}


