//
//  FindJobTableViewCell.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/8/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit

class FindJobTableViewCell: UITableViewCell {
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
    var isHiddenSeparator: Bool? {
        didSet {
            separator.isHidden = self.isHiddenSeparator ?? true ? true : false
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
    @IBAction func likePressed(_ sender: Any) {
    }
    
    @IBAction func commentPressed(_ sender: Any) {
    }
}
