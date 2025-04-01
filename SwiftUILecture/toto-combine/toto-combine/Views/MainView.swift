//
//  MainView.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var noteRepo: NoteRepository
    @State private var showNewNote = false
    @State private var path: [Note] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geometry in
                let cellSize = geometry.size.width / 3
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3), spacing: 0) {
                        ForEach(noteRepo.notes) { note in
                            AsyncImage(url: note.thumbnailURL) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: cellSize, height: cellSize)
                                    .clipped()
                            } placeholder: {
                                Color.gray.opacity(0.2)
                                    .frame(width: cellSize, height: cellSize)
                            }
                            .onTapGesture {
                                path.append(note) // ✅ note를 path에 추가하면 상세 뷰로 이동
                            }
                        }
                    }
                }
                .refreshable {
                    noteRepo.fetchNotes()
                }
                .navigationTitle("노트")
                .onAppear {
                    noteRepo.fetchNotes()
                }
                .overlay(
                    Button(action: {
                        showNewNote = true
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                        .padding(.trailing, 24)
                        .padding(.bottom, 80)
                        ,
                        alignment: .bottomTrailing
                )
                .sheet(isPresented: $showNewNote) {
                    NewNoteView()
                }
            }
            .navigationDestination(for: Note.self) { note in
                NoteDetailView(note: note)
            }
        }
    }
}
