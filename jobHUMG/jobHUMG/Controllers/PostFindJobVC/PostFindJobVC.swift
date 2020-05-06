//
//  PostFindJobVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/5/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class PostFindJobVC: UIViewController {

    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var heightDescriptionTextView: NSLayoutConstraint!
    @IBOutlet weak var heightRegionTextView: NSLayoutConstraint!
    @IBOutlet weak var descriptionTextView: PlaceholderTextView!
    @IBOutlet weak var regionTextView: PlaceholderTextView!
    @IBOutlet weak var careerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaceholderTextView()
        setupView()
    }
    
    private func setupPlaceholderTextView() {
        regionTextView.placeholder = "Nhập địa chỉ công ty"
        regionTextView.heightDidChange = { [weak self] height in
            self?.heightRegionTextView.constant = height > 33 ? height : 33
            if height > 66 {
                self?.heightRegionTextView.constant = 66
            }
        }
        descriptionTextView.placeholder = "Nhập mô tả công việc"
        descriptionTextView.heightDidChange = { [weak self] height in
            self?.heightDescriptionTextView.constant = height > 33 ? height : 33
        }
    }
    
    private func setupView() {
        careerTextField.delegate = self
        self.endEditting()
        navigationView.setGradientBackground(startColor: .mainColor, endColor: .rightGradientColor, gradientDirection: .leftToRight)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PostFindJobVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == careerTextField {
            regionTextView.textView.becomeFirstResponder()
        }
        return true
    }
}
