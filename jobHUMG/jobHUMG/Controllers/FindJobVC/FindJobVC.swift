//
//  FindJobVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/5/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class FindJobVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var listPostFindJob = [DataListPostFindJob]()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        getListPostFindJob()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.registerNibCellFor(type: FindJobTableViewCell.self)
    }
    
    private func getListPostFindJob() {
        ListPostFindJobAPI().excute(target: self, success: { [weak self] response in
            self?.listPostFindJob = response!.data
            self?.tableView.reloadData()
        }, error: { [weak self] error in
            
        })
    }
    
    private func likePost(id: Int) {
        LikePostAPI(id: id).excute(target: self, success: { [weak self] response in
            print(response)
            self?.getListPostFindJob()
        }, error: { [weak self] error in
            print(error)
        })
    }
}

extension FindJobVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPostFindJob.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindJobTableViewCell", for: indexPath) as! FindJobTableViewCell
        cell.selectionStyle = .none
        cell.isHiddentMoreButton = true
        cell.fillData(data: listPostFindJob[indexPath.row])
        
        cell.tapCommentButton = { [weak self] in
            let detailVC = DetailPostFindJobVC()
            detailVC.id = self?.listPostFindJob[indexPath.row].id
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }
        
        cell.tapLikeButton = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.likePost(id: strongSelf.listPostFindJob[indexPath.row].id)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailPostFindJobVC()
        detailVC.id = listPostFindJob[indexPath.row].id
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
