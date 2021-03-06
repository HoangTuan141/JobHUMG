//
//  ReviewCompanyVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/3/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class ReviewCompanyVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupView()
    }
    
    // MARK: - Method
    private func setupView() {
        navigationView.setGradientBackground(startColor: .mainColor, endColor: .rightGradientColor, gradientDirection: .leftToRight)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.registerNibCellFor(type: ReviewCompanyCell.self)
    }
    
    // MARK: - Action
    @IBAction func searchPressed(_ sender: Any) {
        let searchCompanyVC = SearchCompanyVC()
        self.navigationController?.pushViewController(searchCompanyVC, animated: true)
    }
    
    @IBAction func suggestCompanyPressed(_ sender: Any) {
        let suggestPopup = SuggestCompanyPopupVC()
        suggestPopup.modalPresentationStyle = .overCurrentContext
        self.present(suggestPopup, animated: false, completion: nil)
    }
    
}

extension ReviewCompanyVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCompanyCell", for: indexPath) as! ReviewCompanyCell
        cell.selectionStyle = .none
        cell.fillDataTest(avatar: reviewAvatar[indexPath.row], name: reviewName[indexPath.row], rate: Double(reviewStar[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailReviewCompanyVC()
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
