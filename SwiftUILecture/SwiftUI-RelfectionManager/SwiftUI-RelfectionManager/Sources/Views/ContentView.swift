//
//  ContentView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var toastVM: ToastMessageVM
    @EnvironmentObject var reflVM: ReflectionViewModel
    
    var body: some View {
        NavigationStack {
            List(reflVM.reflections) { refl in
                NavigationLink {
                    // destination
                    ReflDetailView(reflection: refl)
                } label: {
                    ReflectionRow(reflection: refl)
                }
            }
            .overlay(content: {
                Group {
                    if reflVM.reflections.isEmpty {
                        emptyStateView
                    }
                }
            })
            .navigationTitle("내 회고 목록")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                NavigationLink {
                    // dest
                    NewReflView()
                } label: {
                    Image(systemName: "plus")
                        .tint(.green)
                }
            }
        }
        .onAppear {
            reflVM.fetchReflections()
        }
    }
    
    private var emptyStateView: some View {
        Text("작성된 회고가 없습니다.")
            .font(.title3)
            .foregroundColor(.gray)
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    ContentView()
        .environmentObject(ReflectionViewModel())
        .environmentObject(ToastMessageVM())
}
