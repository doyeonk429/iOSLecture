//
//  MovieDetailViewController.swift
//  UIKit-Movie
//
//  Created by 김도연 on 2/28/25.
//

import UIKit
import SnapKit
import Then
import Combine

class MovieDetailViewController: UIViewController {
    private let movieId: String
    private var cancellables = Set<AnyCancellable>()
    
    private let movieService = MovieService.shared
    private let detailView = MovieDetailView()
    
    // MARK: - Init
    init(movieId: String) {
        self.movieId = movieId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMovieInfo()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(detailView)
        
        detailView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    // MARK: - API Call
    private func fetchMovieInfo() {
        movieService.fetchMovieDetail(movieId: movieId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("❌ 영화 정보 요청 실패: \(error)")
                }
            }, receiveValue: { [weak self] movieInfo in
                self?.detailView.configure(with: movieInfo)
            })
            .store(in: &cancellables)
    }
    
}
