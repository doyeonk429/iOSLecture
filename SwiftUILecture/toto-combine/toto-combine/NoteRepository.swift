//
//  NoteRepository.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import UIKit

class NoteRepository: ObservableObject {
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
    private let notesCollection = "notes"

    @Published var notes: [Note] = []

    // 1. 노트 추가
    func addNote(title: String, content: String, thumbnailImage: UIImage) {
        guard let imageData = thumbnailImage.jpegData(compressionQuality: 0.8) else { return }
        let imageID = UUID().uuidString
        let imageRef = storage.reference().child("thumbnails/\(imageID).jpg")

        // 1. 이미지 먼저 Storage에 업로드
        imageRef.putData(imageData, metadata: nil) { [weak self] metadata, error in
            if let error = error {
                print("이미지 업로드 실패:", error.localizedDescription)
                return
            }

            // 2. 업로드 완료 후 이미지 URL 가져오기
            imageRef.downloadURL { url, error in
                guard let url = url, error == nil else {
                    print("이미지 URL 가져오기 실패:", error?.localizedDescription ?? "")
                    return
                }

                // 3. Firestore에 노트 데이터 저장
                let docRef = self?.db.collection(self?.notesCollection ?? "").document()
                let noteData: [String: Any] = [
                    "id": docRef?.documentID ?? UUID().uuidString,
                    "title": title,
                    "content": content,
                    "thumbnailURL": url.absoluteString,
                    "createdAt": Timestamp(date: Date())
                ]
                docRef?.setData(noteData)
            }
        }
    }

    // 2. 노트 불러오기 (최신순)
    func fetchNotes() {
        db.collection(notesCollection)
            .order(by: "createdAt", descending: true)
            .getDocuments { [weak self] snapshot, error in
                if let error = error {
                    print("노트 불러오기 실패:", error.localizedDescription)
                    return
                }
                
                self?.notes = snapshot?.documents.compactMap { doc -> Note? in
                    let data = doc.data()
                    guard
                        let title = data["title"] as? String,
                        let content = data["content"] as? String,
                        let urlString = data["thumbnailURL"] as? String,
                        let url = URL(string: urlString),
                        let timestamp = data["createdAt"] as? Timestamp
                    else {
                        return nil
                    }
                    
                    return Note(
                        id: doc.documentID,
                        title: title,
                        content: content,
                        thumbnailURL: url,
                        createdAt: timestamp.dateValue()
                    )
                } ?? []
            }
    }
}
