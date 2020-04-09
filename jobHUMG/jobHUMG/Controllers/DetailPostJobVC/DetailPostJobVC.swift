//
//  DetailPostJobVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/8/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class DetailPostJobVC: UIViewController {
    
    // MARK: - OUTLET
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightCommentTextView: NSLayoutConstraint!
    @IBOutlet weak var heightCommentView: NSLayoutConstraint!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var commentTextView: PlaceholderTextView!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: - Variable
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    // MARK: - Function
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.registerNibCellFor(type: RecruitmentCell.self)
        tableView.registerNibCellFor(type: CommentTableViewCell.self)
    }
    
    private func setupView() {
        enableSendCommentButton(false)
        commentTextView.placeholder = "Viết comment..."
        commentTextView.colorBackground = .lineGray
        commentTextView.heightDidChange = { [weak self] height in
            self?.heightCommentTextView.constant = height > 38 ? height : 38
            print(height)
            if height > 114 {
                self?.heightCommentTextView.constant = 114
            }
            self?.heightCommentView.constant = (self?.heightCommentTextView.constant)! + 20
            if (self?.commentTextView.textView.text.isEmpty)! {
                self?.enableSendCommentButton(false)
            } else {
                self?.enableSendCommentButton(true)
            }
        }
    }
    
    func enableSendCommentButton( _ isUserInteractionEnabled: Bool) {
        if isUserInteractionEnabled {
            sendButton.isUserInteractionEnabled = true
            sendButton.setImage(#imageLiteral(resourceName: "ic_send"), for: .normal)
        } else {
            sendButton.isUserInteractionEnabled = false
            sendButton.setImage(#imageLiteral(resourceName: "ic_send_gray"), for: .normal)
        }
    }
   
    // MARK: - ACTION
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DetailPostJobVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecruitmentCell", for: indexPath) as! RecruitmentCell
            cell.isHiddenSeparator = true
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
