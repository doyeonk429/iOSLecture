//
//  ContentView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ReflectionViewModel()
    var body: some View {
        NavigationStack {
            List(vm.reflections) { refl in
                NavigationLink {
                    // destination
                    ReflDetailView(reflection: refl)
                } label: {
                    VStack(alignment: .leading) {
                        Text(refl.date, style: .date)
                            .font(.headline)
                        Text(refl.content)
                            .font(.subheadline)
                            .lineLimit(1)
                            .foregroundStyle(.gray)
                    }
                }
            }
        } // : naviStack
        .navigationTitle("내 회고 목록")
        .toolbar {
            NavigationLink("새 회고 작성하기") {
                // dest
                NewReflView()
                    .environmentObject(vm)
            }
        }.onAppear {
            vm.fetchReflections()
        }
    }
}

#Preview {
    ContentView()
}
