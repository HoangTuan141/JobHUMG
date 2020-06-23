//
//  FindJobTableViewCell.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/8/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class FindJobTableViewCell: UITableViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconLikeImage: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var moreButton: UIButton!
    
    // MARK: - Property
    var isHiddenSeparator: Bool? {
        didSet {
            separator.isHidden = self.isHiddenSeparator ?? true ? true : false
        }
    }
    
    var isHiddentMoreButton: Bool? {
        didSet {
            moreButton.isHidden = self.isHiddentMoreButton ?? true ? true : false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Action
    @IBAction func likePressed(_ sender: Any) {
        
    }
    
    @IBAction func commentPressed(_ sender: Any) {
        
    }
    
    @IBAction func morePressed(_ sender: Any) {
    }
}

extension FindJobTableViewCell {
    func fillData(data: DataListPostFindJob) {
        avatarImage.image = UIImage(named: data.userAvatar)
        nameLabel.text = data.userName
        timeLabel.text = "\(data.createdAt)"
        careerLabel.text = data.career
        addressLabel.text = data.location
        descriptionLabel.text = data.description
        
    }
    
    func fillData(data: DataDetailPostFindJob) {
        avatarImage.image = UIImage(named: data.userAvatar)
        nameLabel.text = data.userName
        timeLabel.text = "\(data.createdAt)"
        careerLabel.text = data.career
        addressLabel.text = data.location
        descriptionLabel.text = data.description
    }
}
