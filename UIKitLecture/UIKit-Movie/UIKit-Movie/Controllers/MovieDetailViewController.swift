//
//  MovieDetailViewController.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/28/25.
//

import UIKit
import SnapKit
import Then
import SDWebImage

//class MovieDetailViewController: UIViewController {
//    private let movie: Movie
//    
//    private let posterImageView = UIImageView().then {
//        $0.contentMode = .scaleAspectFit
//        $0.clipsToBounds = true
//        $0.layer.cornerRadius = 10
//    }
//    
//    private let titleLabel = UILabel().then {
//        $0.font = .boldSystemFont(ofSize: 20)
//        $0.textAlignment = .center
//        $0.numberOfLines = 2
//    }
//
//    init(movie: Movie) {
//        self.movie = movie
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        configureUI()
//    }
//
//    private func setupUI() {
//        self.navigationItem.title = movie.title
//        
//        view.backgroundColor = .systemBackground
//        view.addSubview(posterImageView)
//
//        posterImageView.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(200)
//            $0.height.equalTo(300)
//        }
//    }
//
//    private func configureUI() {
//        titleLabel.text = movie.title
//        posterImageView.sd_setImage(with: URL(string: movie.posterImageURL))
//    }
//}
