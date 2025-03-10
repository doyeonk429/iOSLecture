//
//  MemoListViewModel.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import Foundation
import Combine

final class MemoListViewModel {
    
    struct Input {
        let fetchMemos: PassthroughSubject<Void, Never> = .init()
        let deleteMemo: PassthroughSubject<String, Never> = .init()
    }

    struct Output {
        let memoList = CurrentValueSubject<[Memo], Never>([])
    }
    
    let input = Input()
    let output = Output()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        bind()
    }

    private func bind() {
        input.fetchMemos
            .sink { [weak self] in
                self?.output.memoList.send(self?.loadMemos() ?? [])
            }
            .store(in: &cancellables)

        input.deleteMemo
            .sink { [weak self] memoId in
                self?.deleteMemo(id: memoId)
            }
            .store(in: &cancellables)
    }
    
    private func loadMemos() -> [Memo] {
        return [
            Memo(id: "1", imageURL: "", previewText: "첫 번째 메모", date: Date()),
            Memo(id: "2", imageURL: "", previewText: "두 번째 메모", date: Date())
        ]
    }
    
    
    private func deleteMemo(id: String) {
        let filtered = output.memoList.value.filter { $0.id != id }
        output.memoList.send(filtered)
    }
    
}
