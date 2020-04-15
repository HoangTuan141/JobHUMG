//
//  SearchCompanyVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/15/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class SearchCompanyVC: UIViewController {

    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupTableView()
    }
    
    private func setupTextField() {
        companyNameTextField.becomeFirstResponder()
        companyNameTextField.addTarget(self, action: #selector(searchCompany), for: .editingChanged)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.registerNibCellFor(type: SearchCompanyTableCell.self)
    }
    
    @objc func searchCompany() {
        
    }

    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SearchCompanyVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCompanyTableCell", for: indexPath) as! SearchCompanyTableCell
        return cell
    }
    
    
}
