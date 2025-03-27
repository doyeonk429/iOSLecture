//
//  View+.swift
//  SwiftUIActivity
//
//  Created by 김도연 on 3/27/25.
//

import SwiftUI

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view!
        
        view.bounds = CGRect(origin: .zero, size: view.intrinsicContentSize)
        view.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        return renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
    }
}
