//
//  MemoEditViewController.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import UIKit
import PhotosUI
import Combine

class MemoEditViewController: UIViewController {
    private let editView = MemoEditView()
    private var memo: Memo?
    private let viewModel = MemoEditViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    init(memo: Memo? = nil) {
        self.memo = memo
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = editView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupGesture()
        setupData()
        bindViewModel()
    }

    private func setupNavigation() {
        title = memo == nil ? "메모 작성" : "메모 수정"

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "저장", style: .done, target: self, action: #selector(saveMemo)
        )
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        editView.imageView.addGestureRecognizer(tapGesture)
    }
    
    private func setupData() {
        if let memo = memo {
            if let image = ImageManager.shared.loadImage(from: memo.imageURL) {
                editView.imageView.image = image
            } else {
                editView.imageView.image = UIImage(systemName: "photo")
            }
            editView.textView.text = memo.previewText
            editView.updateDateLabel(date: memo.date)
        } else {
            editView.updateDateLabel(date: Date())
        }
    }
    
    private func bindViewModel() {
        viewModel.output.saveSuccess
            .sink { [weak self] success in
                if success {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
            .store(in: &cancellables)
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
        let previewText = editView.textView.text ?? ""
        let date = Date()

        var imageURL = ""
        if let image = editView.imageView.image {
            imageURL = ImageManager.shared.saveImageToDocuments(image: image) ?? ""
        }

        if let existingMemo = memo {
            let updatedMemo = Memo(id: existingMemo.id, imageURL: imageURL, previewText: previewText, date: date)
            viewModel.input.saveMemo.send(updatedMemo)
        } else {
            let newMemo = Memo(id: UUID().uuidString, imageURL: imageURL, previewText: previewText, date: date)
            viewModel.input.saveMemo.send(newMemo)
        }
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
