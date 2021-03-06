//
//  DetailPostFindJobVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/9/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class DetailPostFindJobVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var heightCommentView: NSLayoutConstraint!
    @IBOutlet weak var commentTextView: PlaceholderTextView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var heightCommentTextView: NSLayoutConstraint!
    @IBOutlet weak var navigationView: UIView!
    
    // MARK: - Variable
    var id: Int?
    private var postFindJob: DataDetailPostFindJob?
    private var listComment = [CommentDetailPostFindJob]()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        getDetailPostFindJob()
    }
    
    // MARK: - Function
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.registerNibCellFor(type: FindJobTableViewCell.self)
        tableView.registerNibCellFor(type: CommentTableViewCell.self)
    }
    
    private func setupView() {
        navigationView.setGradientBackground(startColor: .mainColor, endColor: .rightGradientColor, gradientDirection: .leftToRight)
        enableSendCommentButton(false)
        commentTextView.placeholder = "Viết comment..."
        commentTextView.colorBackground = .lineGray
        commentTextView.heightDidChange = { [weak self] height in
            self?.heightCommentTextView.constant = height > 38 ? height : 38
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
    
    func getDetailPostFindJob() {
        DetailPostFindJobAPI(id: self.id ?? 0).excute(target: self, success: { [weak self] response in
            self?.postFindJob = response?.data
            self?.listComment = (response?.data!.comment)!
            self?.tableView.reloadData()
        }, error: { [weak self] error in
            
        })
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
    
    // MARK: - Action
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendCommentPressed(_ sender: Any) {
        
    }
}

extension DetailPostFindJobVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return listComment.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FindJobTableViewCell", for: indexPath) as! FindJobTableViewCell
            cell.isHiddenSeparator = true
            cell.selectionStyle = .none
            if let detailPostFindJob = self.postFindJob {
                cell.fillData(data: detailPostFindJob)
            }
            cell.isHiddentMoreButton = true
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
