//
//  ImagePickerView.swift
//  SwiftUIKitPractice
//
//  Created by 김도연 on 3/27/25.
//

import SwiftUI
import UIKit

// UIKit의 UIImagePickerController를 SwiftUI에서 사용하기 위한 래퍼
struct ImagePickerView: UIViewControllerRepresentable {
    // 상위 SwiftUI View와 선택된 이미지를 공유하기 위한 @Binding
    @Binding var selectedImage: UIImage?

    // Coordinator는 UIKit의 델리게이트 패턴을 처리하기 위한 중간 객체
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        // SwiftUI 뷰의 참조를 저장
        var parent: ImagePickerView

        // 초기화 시 부모 뷰를 주입받아 보관
        init(parent: ImagePickerView) {
            self.parent = parent
        }

        // 사용자가 이미지를 선택했을 때 호출되는 UIKit 델리게이트 메서드
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            // 사용자가 선택한 원본 이미지를 추출하여 @Binding으로 SwiftUI에 전달
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            // 이미지 선택 후 뷰를 닫음
            picker.dismiss(animated: true)
        }

        // 사용자가 취소를 눌렀을 때 뷰를 닫음
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    // SwiftUI → UIKit으로 연결되는 Coordinator 객체 생성
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    // SwiftUI가 생성할 UIKit 뷰 컨트롤러를 반환 (여기서는 이미지 선택기)
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator  // 델리게이트를 Coordinator로 설정
        return picker
    }

    // UIViewController가 업데이트될 때 호출되지만, 여기서는 불필요
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
