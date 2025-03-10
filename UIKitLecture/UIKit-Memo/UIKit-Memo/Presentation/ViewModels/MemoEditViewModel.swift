//
//  MemoEditViewModel.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import Foundation
import Combine

final class MemoEditViewModel {

    struct Input {
        let saveMemo: PassthroughSubject<Memo, Never> = .init()
    }

    struct Output {
        let saveSuccess = PassthroughSubject<Bool, Never>()
    }

    let input = Input()
    let output = Output()
    private var cancellables = Set<AnyCancellable>()

    init() {
        bind()
    }

    private func bind() {
        input.saveMemo
            .sink { [weak self] memo in
                self?.saveMemo(memo)
            }
            .store(in: &cancellables)
    }

    private func saveMemo(_ memo: Memo) {
        // TODO: Core Data 저장 로직 추가
        print("메모 저장: \(memo.previewText)")
        output.saveSuccess.send(true)
    }
}
