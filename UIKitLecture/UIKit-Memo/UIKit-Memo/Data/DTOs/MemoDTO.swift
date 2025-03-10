//
//  MemoDTO.swift
//  UIKit-Memo
//
//  Created by 김도연 on 3/10/25.
//

import Foundation

struct Memo: Identifiable {
    let id: String
    let imageURL: String
    let previewText: String
    let date: Date
}
