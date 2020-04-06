//
//  PostJobVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/5/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class PostJobVC: UIViewController {
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
        addressTextView.padding = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        addressTextView.heightDidChange = { [weak self] height in
            self?.heightAddressTextView.constant = height > 44 ? height : 44
    }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func postPressed(_ sender: Any) {
        
    }
    
}
