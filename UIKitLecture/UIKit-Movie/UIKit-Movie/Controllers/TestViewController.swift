//
//  TestViewController.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/3/25.
//

import UIKit
import Combine
import SnapKit
import Then

final class TestViewController: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    private let movieService = MovieService.shared
    private var movies: [DailyBoxOffice] = []
    
    private let tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.separatorStyle = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Box Office"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
    }
    
    private func fetchData() {
//        let today = DateFormatter.customFormatter.string(from: Date()) // "yyyyMMdd" 형식 날짜 변환
        
        movieService.fetchDailyBoxOffice(date: "20250225")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("❌ API 요청 실패: \(error)")
                }
            }, receiveValue: { [weak self] movies in
                self?.movies = movies
                self?.tableView.reloadData()
            })
            .store(in: &cancellables)
    }
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = "\(movie.rank). \(movie.movieNm)"
        return cell
    }
}

// ✅ DateFormatter 확장 (yyyyMMdd 형식 변환)
extension DateFormatter {
    static let customFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
}
