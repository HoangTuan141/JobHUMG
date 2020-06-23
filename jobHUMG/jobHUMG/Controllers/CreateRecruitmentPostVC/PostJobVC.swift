//
//  PostJobVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/5/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class PostJobVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var careerTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var addressTextView: PlaceholderTextView!
    @IBOutlet weak var descriptionTextView: PlaceholderTextView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var heightAddressTextView: NSLayoutConstraint!
    @IBOutlet weak var heightDescriptionTextView: NSLayoutConstraint!
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var startTimeRecruitmentTextField: UITextField!
    @IBOutlet weak var endTimeRecruitmentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Method
    private func setupView() {
        navigationView.setGradientBackground(startColor: .mainColor, endColor: .rightGradientColor, gradientDirection: .leftToRight)
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
    
    private func createRecruitmentPost(career: String, companyName: String, salary: String, location: String, description: String, startTime: Int, endTime: Int) {
        CreateRecruitmentPost(carrer: career, companyName: companyName, salary: salary, location: location, description: description, startDate: startTime, endDate: endTime).excute(target: self, success: { [weak self] response in
            print("ok")
        }, error: { [weak self] error in
            
        })
    }
    
    // MARK: Action
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func postPressed(_ sender: Any) {
        createRecruitmentPost(career: careerTextField.text!, companyName: companyTextField.text!, salary: salaryTextField.text!, location: addressTextView.textView.text!, description: descriptionTextView.textView.text!, startTime: 1587426600, endTime: 1597426600)
    }
    
}
