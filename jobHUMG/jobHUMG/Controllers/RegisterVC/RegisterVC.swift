//
//  RegisterVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/3/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    //MARK: - OUTLET
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var agreePolicyButton: UIButton!
    @IBOutlet weak var policyLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var RetypePasswordTextField: UITextField!
    
    private var isSelectedPolicy = false
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    //MARK: - FUNCTION
    private func setupView() {
        policyLabel.underlineAttribute(text: "Tôi đã đọc và đồng ý với điều khoản sử dụng")
    }
    
    //MARK: - ACTION
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func agreePolicyPressed(_ sender: Any) {
        isSelectedPolicy = !isSelectedPolicy
        if isSelectedPolicy {
            agreePolicyButton.setImage(#imageLiteral(resourceName: "ic_checkbox"), for: .normal)
        } else {
            agreePolicyButton.setImage(nil, for: .normal)
        }
    }
    
    @IBAction func showPolicyPressed(_ sender: Any) {
    }
    
    @IBAction func registerPressed(_ sender: Any) {
    }
    
}
