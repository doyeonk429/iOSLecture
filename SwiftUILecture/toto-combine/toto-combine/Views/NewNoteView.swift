//
//  NewNoteView.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import SwiftUI

struct NewNoteView: View {
    @EnvironmentObject var noteRepo: NoteRepository
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var content = ""
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("제목")) {
                    TextField("제목을 입력하세요", text: $title)
                }

                Section(header: Text("내용")) {
                    TextEditor(text: $content)
                        .frame(height: 150)
                }

                Section(header: Text("썸네일 이미지")) {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(8)
                    } else {
                        Button("이미지 선택") {
                            showImagePicker = true
                        }
                    }
                }
            }
            .navigationTitle("새 노트 작성")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("저장") {
                        guard let image = selectedImage else { return }
                        noteRepo.addNote(title: title, content: content, thumbnailImage: image)
                        dismiss()
                    }
                    .disabled(title.isEmpty || content.isEmpty || selectedImage == nil)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") {
                        dismiss()
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
        }
    }
}
