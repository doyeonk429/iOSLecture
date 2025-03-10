//
//  MemoEditViewController.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import UIKit
import PhotosUI

class MemoEditViewController: UIViewController {
    private let editView = MemoEditView()

    override func loadView() {
        view = editView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupGesture()
        editView.updateDateLabel(date: Date()) // 현재 날짜 표시
    }

    private func setupNavigation() {
        title = "메모 작성"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "저장", style: .done, target: self, action: #selector(saveMemo)
        )
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        editView.imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func selectImage() {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc private func saveMemo() {
        // TODO: ViewModel 연결하여 데이터 저장
        navigationController?.popViewController(animated: true)
    }

}

extension MemoEditViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)

        guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }

        provider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
            DispatchQueue.main.async {
                self?.editView.imageView.image = image as? UIImage
            }
        }
    }
}
