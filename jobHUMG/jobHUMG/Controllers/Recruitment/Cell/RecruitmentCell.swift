//
//  RecruitmentCell.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/6/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class RecruitmentCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconLikeImage: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var moreButton: UIButton!
    
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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(avatar: String,  name: String, time: String, company: String, salary: String, description: String) {
        avatarImage.image = UIImage(named: avatar)
        nameLabel.text = name
        timeLabel.text = time
        companyNameLabel.text = company
        salaryLabel.text = salary
        descriptionLabel.text = description
        
    }
    
    @IBAction func morePressed(_ sender: Any) {
        
    }
    
    @IBAction func likePressed(_ sender: Any) {
        
    }
    
    @IBAction func commentPressed(_ sender: Any) {
        
    }
}
