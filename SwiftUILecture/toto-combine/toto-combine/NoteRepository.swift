//
//  NoteRepository.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import UIKit

class NoteRepository: ObservableObject {
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
    private let notesCollection = "notes"

    var notes: [Note] = []
    
    func addNote(title: String, content: String, thumbnailImage: UIImage) async throws {
        guard let imageData = thumbnailImage.jpegData(compressionQuality: 0.5) else { throw NSError(domain: "Invalid Image Data", code: 100, userInfo: nil) }
        guard let uid = Auth.auth().currentUser?.uid else { throw NSError(domain: "User not authenticated", code: 101, userInfo: nil) }
        
        let imageID = UUID().uuidString
        let imageRef = storage.reference().child("thumbnails/\(imageID).jpg")
        
        // 1. 이미지 업로드 (비동기 처리)
        _ = try await imageRef.putDataAsync(imageData)
        
        // 2. 이미지 URL 가져오기
        let url = try await imageRef.downloadURL()
        
        // 3. Firestore에 노트 데이터 저장
        let docRef = db.collection(notesCollection).document()
        let noteData: [String: Any] = [
            "id": docRef.documentID,
            "title": title,
            "content": content,
            "thumbnailURL": url.absoluteString,
            "createdAt": Timestamp(date: Date()),
            "ownerUID": uid
        ]
        try await docRef.setData(noteData)
    }
    
    func fetchNotes() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { throw NSError(domain: "User not authenticated", code: 101, userInfo: nil) }
        
        let snapshot = try await db.collection(notesCollection)
            .whereField("ownerUID", isEqualTo: uid)
            .order(by: "createdAt", descending: true)
            .getDocuments()
        
        self.notes = snapshot.documents.compactMap { doc in
            try? doc.data(as: Note.self)
        }
    }

    // 1. 노트 추가
//    func addNote(title: String, content: String, thumbnailImage: UIImage) {
//        guard let imageData = thumbnailImage.jpegData(compressionQuality: 0.5) else { return }
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let imageID = UUID().uuidString
//        let imageRef = storage.reference().child("thumbnails/\(imageID).jpg")
//
//        // 1. 이미지 먼저 Storage에 업로드
//        imageRef.putData(imageData, metadata: nil) { [weak self] metadata, error in
//            if let error = error {
//                print("이미지 업로드 실패:", error.localizedDescription)
//                return
//            }
//
//            // 2. 업로드 완료 후 이미지 URL 가져오기
//            imageRef.downloadURL { url, error in
//                guard let url = url, error == nil else {
//                    print("이미지 URL 가져오기 실패:", error?.localizedDescription ?? "")
//                    return
//                }
//
//                // 3. Firestore에 노트 데이터 저장
//                
//                let docRef = self?.db.collection(self?.notesCollection ?? "").document()
//                let noteData: [String: Any] = [
//                    "id": docRef?.documentID ?? UUID().uuidString,
//                    "title": title,
//                    "content": content,
//                    "thumbnailURL": url.absoluteString,
//                    "createdAt": Timestamp(date: Date()),
//                    "ownerUID": uid
//                ]
//                docRef?.setData(noteData)
//            }
//        }
//    }

    // 2. 노트 불러오기 (최신순)
//    func fetchNotes() {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        
//        db.collection(notesCollection)
//            .whereField("ownerUID", isEqualTo: uid)
//            .order(by: "createdAt", descending: true)
//            .getDocuments { [weak self] snapshot, error in
//                if let error = error {
//                    print("노트 불러오기 실패:", error.localizedDescription)
//                    return
//                }
//                
//                self?.notes = snapshot?.documents.compactMap { doc in
//                    try? doc.data(as: Note.self)
//                } ?? []
//            }
//    }
}
