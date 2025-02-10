//
//  ContentView.swift
//  SwiftUIDay01Ex03
//
//  Created by 김도연 on 2/10/25.
//

import SwiftUI

struct ArrayManagerView: View {
    @State private var words: [String] = []   // 단어를 저장할 배열
    @State private var newWord: String = ""  // 새로 입력할 단어
    @State private var searchkeyWord: String = ""  // 검색할 단어
    @State private var wordToDelete: String = "" // 삭제할 단어
    @State private var message: String = ""  // 상태 메시지

    var body: some View {
        VStack {
            VStack {
                Text("단어 관리 프로그램")
                    .font(.largeTitle)
                    .background(.yellow)
                    .padding(.bottom, 2.0)
                Text("현재 저장된 단어 개수 \(words.count)개")
                    .font(.title3)
            }
            .padding(.bottom, 2.0)
            
            // 검색 기능
            HStack(alignment: .center) {
                TextField("검색할 단어 입력", text: $searchkeyWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing)
                
                Button(action: {
                    searchWord()
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.bordered)
            }

            // 단어 추가
            HStack(alignment: .center) {
                TextField("저장할 단어 입력", text: $newWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing)
                Button(action: {
                    addWord()
                }) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.bordered)
            }

            // 단어 목록 (애니메이션 추가)
            List {
                ForEach(words, id: \.self) { word in
                    Text(word)
                        .transition(.opacity) // Fade-in/out 효과 적용
                }
                .onDelete(perform: deleteWordAt)
            }

            // 단어 삭제
            HStack(alignment: .center) {
                TextField("삭제할 단어 입력", text: $wordToDelete)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing)
                Button(action: {
                    deleteWord()
                }) {
                    Image(systemName: "trash")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .buttonStyle(.bordered)
            }

            // 메시지 표시 (애니메이션 적용)
            Text(message)
                .foregroundColor(.red)
                .padding()
                .animation(.easeInOut, value: message) // 메시지 애니메이션 적용
        }
        .padding()
    }

    // 단어 추가 함수
    func addWord() {
        if words.contains(newWord) {
            message = "이미 존재하는 단어입니다."
        } else if !newWord.isEmpty {
            withAnimation {
                words.append(newWord)
            }
            newWord = ""
            message = "단어가 추가되었습니다."
        } else {
            message = "단어를 입력하세요."
        }
    }

    // 단어 삭제 함수
    func deleteWord() {
        if let index = words.firstIndex(of: wordToDelete) {
            words.remove(at: index)
            message = "'\(wordToDelete)'을(를) 삭제했습니다."
            wordToDelete = ""
        } else {
            message = "해당 단어가 목록에 없습니다."
        }
    }

    // 단어 검색 기능
    func searchWord() {
        if let index = words.firstIndex(of: searchkeyWord) {
            message = "\(searchkeyWord)은(는) 배열의 \(index)번째 위치에 있습니다."
        } else {
            message = "해당 단어가 목록에 없습니다."
        }
    }

    // 리스트에서 삭제 (Swipe 삭제)
    func deleteWordAt(offsets: IndexSet) {
        withAnimation {
            words.remove(atOffsets: offsets)
        }
    }
}

struct ArrayManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ArrayManagerView()
    }
}
