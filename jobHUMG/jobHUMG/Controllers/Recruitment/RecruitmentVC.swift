//
//  RecruitmentVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/5/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class RecruitmentVC: UIViewController {

    // MARK: - OUTLET
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Variable
    var listPost = [DataListRecruitmentPost]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getListRecruitmentPost()
    }
    
    // MARK: Method
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.registerNibCellFor(type: RecruitmentCell.self)
    }
    
    private func getListRecruitmentPost() {
        ListRecruitmentPostAPI().excute(target: self, success: { [weak self] response in
            self?.listPost = response!.data
            self?.tableView.reloadData()
        },error: {[weak self] error in
            print(error)
            })
    }
    
    private func likePost(id: Int) {
        LikePostAPI(id: id).excute(target: self, success: { [weak self] response in
            print(response)
            self?.getListRecruitmentPost()
        }, error: { [weak self] error in
            print(error)
        })
    }
}

extension RecruitmentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecruitmentCell", for: indexPath) as! RecruitmentCell
        cell.selectionStyle = .none
        cell.isHiddentMoreButton = true
        cell.fillData(data: listPost[indexPath.row])
        
        cell.tapCommentButton = { [weak self] in
            let vc = DetailPostJobVC()
            vc.id = self?.listPost[indexPath.row].id
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.tapLikeButton = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.likePost(id: strongSelf.listPost[indexPath.row].id)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailPostJobVC()
        vc.id = listPost[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
