//
//  ExtensionUIViewController.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/3/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import Toast_Swift

extension UIViewController: NVActivityIndicatorViewable {
    func showLoading() {
        let size = CGSize(width: 50, height: 50)
        startAnimating(size, message: "", type: .circleStrokeSpin)
    }
    
    func hideLoading() {
        stopAnimating()
    }
}

extension UIViewController {
    func addViewControllerToView(view: UIView, subViewController: UIViewController) {
        self.addChild(subViewController)
        view.addSubview(subViewController.view)
        subViewController.view.frame = view.bounds
        subViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subViewController.didMove(toParent: self)
    }
    
    func showToast(mess: String, messColor: UIColor? , background: UIColor? , position: ToastPosition) {
        var toastStyle = ToastStyle()
        toastStyle.backgroundColor = background ?? .black
        toastStyle.messageColor = messColor ?? .white
        self.view.makeToast(mess, duration: 3.0, position: position, style: toastStyle)
    }
}
