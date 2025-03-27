//
//  ContentView.swift
//  SwiftUIKitPractice
//
//  Created by 김도연 on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    // showImagePicker가 true가 되면 이미지 선택 Sheet가 표시됨
    @State private var showImagePicker = false
    // 선택된 이미지를 저장하는 상태 변수 (UIImage는 UIKit 타입)
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                // UIKit의 UIImage를 SwiftUI의 Image로 변환하여 표시
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                Text("\(image.description)")
            } else {
                Text("선택된 이미지 없음")
            }
            // 버튼을 클릭하면 showImagePicker가 true가 되어 시트를 띄움
            Button("사진 선택") {
                showImagePicker = true
            }
            .padding()
            
        }
        .padding()
        .background(.white)
        .sheet(isPresented: $showImagePicker) {
            // Binding을 통해 ImagePickerView와 selectedImage 상태 공유
            ImagePickerView(selectedImage: $selectedImage)
        }
    }
}

#Preview {
    ContentView()
}
