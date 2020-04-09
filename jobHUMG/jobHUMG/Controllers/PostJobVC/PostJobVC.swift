//
//  PostJobVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/5/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class PostJobVC: UIViewController {
    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var careerTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var addressTextView: PlaceholderTextView!
    @IBOutlet weak var descriptionTextView: PlaceholderTextView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var heightAddressTextView: NSLayoutConstraint!
    @IBOutlet weak var heightDescriptionTextView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        addressTextView.placeholder = "Nhập địa chỉ công ty"
        addressTextView.heightDidChange = { [weak self] height in
            self?.heightAddressTextView.constant = height > 33 ? height : 33
            if height > 66 {
                self?.heightAddressTextView.constant = 66
            }
        }
        descriptionTextView.placeholder = "Nhập mô tả công việc"
        descriptionTextView.heightDidChange = { [weak self] height in
            self?.heightDescriptionTextView.constant = height > 33 ? height : 33
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func postPressed(_ sender: Any) {
        
    }
    
}
