//
//  ImageManager.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import UIKit

final class ImageManager {

    static let shared = ImageManager()

    private init() {}

    /// 이미지를 저장하고, 저장된 로컬 파일 URL 반환
    func saveImageToDocuments(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }

        let filename = UUID().uuidString + ".jpg"
        let fileURL = getDocumentsDirectory().appendingPathComponent(filename)

        do {
            try data.write(to: fileURL)
            return fileURL.absoluteString
        } catch {
            print("❌ 이미지 저장 실패: \(error)")
            return nil
        }
    }

    /// 저장된 이미지 불러오기 (fileURL 기반)
    func loadImage(from urlString: String) -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }

    /// 앱의 Documents 디렉토리 경로 가져오기
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
