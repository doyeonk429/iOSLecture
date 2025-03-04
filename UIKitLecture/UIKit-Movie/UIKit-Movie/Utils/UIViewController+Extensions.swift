//
//  UIViewController+Extensions.swift
//  UIKit-Movie
//
//  Created by 김도연 on 3/4/25.
//

import UIKit
import SnapKit
import NVActivityIndicatorView

extension UIViewController {
    
    private struct LoadingIndicator {
        static var activityIndicator: NVActivityIndicatorView?
    }
    
    func startLoading() {
        guard LoadingIndicator.activityIndicator == nil else { return } // 이미 있으면 중복 생성 방지
        
        let indicator = NVActivityIndicatorView(
            frame: .zero,
            type: .ballSpinFadeLoader,
            color: .systemGray,
            padding: 50
        )
        
        view.addSubview(indicator)
        indicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        indicator.startAnimating()
        LoadingIndicator.activityIndicator = indicator
    }
    
    func stopLoading() {
        LoadingIndicator.activityIndicator?.stopAnimating()
        LoadingIndicator.activityIndicator?.removeFromSuperview()
        LoadingIndicator.activityIndicator = nil
    }
}
