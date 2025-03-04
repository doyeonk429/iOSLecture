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
    
    private let testView = TestView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData(for: yesterday())
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(testView)
        testView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        title = "일간 박스오피스 순위"
        
        testView.tableView.dataSource = self
        testView.tableView.delegate = self
        testView.tableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: "BoxOfficeCell")
        
        // ✅ 날짜 선택 시 API 호출
        testView.datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    @objc private func dateChanged() {
        let selectedDate = testView.datePicker.date
        fetchData(for: selectedDate)
    }
    
    private func fetchData(for date: Date) {
        let dateString = DateFormatter.customFormatter.string(from: date) // "yyyyMMdd" 형식으로 변환
        
        startLoading()
        
        movieService.fetchDailyBoxOffice(date: dateString)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.stopLoading()
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("❌ API 요청 실패: \(error)")
                }
            }, receiveValue: { [weak self] movies in
                self?.movies = movies
                self?.testView.tableView.reloadData()
            })
            .store(in: &cancellables)
    }
    
    private func yesterday() -> Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
}

// MARK: - UITableViewDataSource
extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoxOfficeCell", for: indexPath) as? BoxOfficeTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}


// MARK: - UITableViewDelegate
extension TestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedMovie = movies[indexPath.row]
        let movieDetailVC = MovieDetailViewController(movieId: selectedMovie.movieCd)
        
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
