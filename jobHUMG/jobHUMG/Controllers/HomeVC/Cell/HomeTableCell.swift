//
//  HomeTableCell.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/5/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(image: String, userName: String, time: String, content: String, like: Int, comment: Int, isLiked: Bool) {
        avatarImage.kf.setImage(with: URL(string: image))
        nameLabel.text = userName
        timeLabel.text = time
        contentLabel.text = content
        likeLabel.text = "\(like) Like"
        commentLabel.text = "\(comment) Comment"
        if isLiked {
            likeLabel.textColor = .mainColor
        } else {
            likeLabel.textColor = .grayColor
        }
        print(contentLabel.numberOfLines)
    }
    
    @IBAction func likePressed(_ sender: Any) {
    }
    
    @IBAction func commentPressed(_ sender: Any) {
    }
    
}
