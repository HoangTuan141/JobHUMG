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
    
    func endEditting(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func addViewControllerToView(view: UIView, subViewController: UIViewController) {
        self.addChild(subViewController)
        view.addSubview(subViewController.view)
        subViewController.view.frame = view.bounds
        subViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subViewController.didMove(toParent: self)
    }
    
    func setTablayout(toView: UIView, leftView: UIViewController, rightView: UIViewController, leftTitle: String, rightTitle: String) {
        let pageViewVC = PageViewVC()
        pageViewVC.leftTitle = leftTitle
        pageViewVC.rightTitle = rightTitle
        pageViewVC.leftView = leftView
        pageViewVC.rightView = rightView
        self.addChild(pageViewVC)
        toView.addSubview(pageViewVC.view)
        pageViewVC.view.frame = toView.bounds
        pageViewVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pageViewVC.didMove(toParent: self)
    }
    
    func showToast(mess: String, messColor: UIColor? , background: UIColor? , position: ToastPosition) {
        var toastStyle = ToastStyle()
        toastStyle.backgroundColor = background ?? .black
        toastStyle.messageColor = messColor ?? .white
        self.view.makeToast(mess, duration: 3.0, position: position, style: toastStyle)
    }
    
    func showPopup(title: String, subTitle: String, titleLeftButton: String, titleRightButton: String, onClickLeft: (() -> Void)?, onClickRight: (() -> Void)?) {
        let popupVC = PopupVC()
        popupVC.titleText = title
        popupVC.subTitle = subTitle
        popupVC.titleLeftButton = titleLeftButton
        popupVC.titleRightButton = titleRightButton
        popupVC.onClickLeft = {
            onClickLeft?()
        }
        popupVC.onClickRight = {
            onClickRight?()
        }
        popupVC.modalPresentationStyle = .overCurrentContext
        self.present(popupVC, animated: false, completion: nil)
    }
}

