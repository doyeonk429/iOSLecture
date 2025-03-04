//
//  TestView.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/4/25.
//

import UIKit
import SnapKit
import Then
import Combine

final class TestView: UIView {
    
    // MARK: - UI Components
    private let dateLabel = UILabel().then {
        $0.text = "조회하고 싶은 날짜를 선택하세요"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textAlignment = .center
        $0.textColor = .darkGray
    }
    
    let datePicker = UIDatePicker().then {
        $0.datePickerMode = .date
        $0.preferredDatePickerStyle = .compact
        $0.maximumDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        $0.locale = Locale(identifier: "ko_KR")
    }
    
    let tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.separatorStyle = .singleLine
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.backgroundColor = .systemBackground
        
        let components = [dateLabel, datePicker, tableView]
        components.forEach { addSubview($0) } // ✅ 배열로 addSubview 처리
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(8) // ✅ dateLabel 아래에 배치
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
