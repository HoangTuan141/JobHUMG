//
//  HomeVC.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/3/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
   
    @IBOutlet weak var tablayoutView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTablayout(toView: tablayoutView, leftView: RecruitmentVC(), rightView: FindJobVC(), leftTitle: "TUYỂN DỤNG", rightTitle: "TÌM VIỆC")
    }
    
    @IBAction func postPressed(_ sender: Any) {
        self.showPopup(title: "Đăng bài", subTitle: "Chọn loại bài đăng", titleLeftButton: "Tuyển dụng", titleRightButton: "Tìm việc", onClickLeft: {
            let postJobVC = PostJobVC()
            self.navigationController?.pushViewController(postJobVC, animated: true)
        }, onClickRight:{
            let postFindJobVC = PostFindJobVC()
            self.navigationController?.pushViewController(postFindJobVC, animated: true)
        })
    }
    
}
