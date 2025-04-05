//
//  NotesViewModel.swift
//  toto-combine
//
//  Created by 김도연 on 4/4/25.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class NotesViewModel: ObservableObject {
    private var noteRepository = NoteRepository()

    @Published var notes: [Note] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // 1. 노트 추가
    func addNote(title: String, content: String, thumbnailImage: UIImage) {
        Task {
            await MainActor.run { isLoading = true }
            do {
                try await noteRepository.addNote(title: title, content: content, thumbnailImage: thumbnailImage)
                fetchNotes()
            } catch {
                await MainActor.run {
                    errorMessage = "노트 추가 실패: \(error.localizedDescription)"
                }
            }
            await MainActor.run { isLoading = false }
        }
    }

    // 2. 노트 불러오기
    func fetchNotes() {
        Task {
            await MainActor.run { isLoading = true }
            do {
                try await noteRepository.fetchNotes()
                await MainActor.run { self.notes = noteRepository.notes }
            } catch {
                await MainActor.run {
                    errorMessage = "노트 불러오기 실패: \(error.localizedDescription)"
                }
            }
            await MainActor.run { isLoading = false }
        }
    }
}
