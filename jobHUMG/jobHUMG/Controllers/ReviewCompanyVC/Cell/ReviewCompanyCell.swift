//
//  ReviewCompanyCell.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/13/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class ReviewCompanyCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingView.isUserInteractionEnabled = false
    }
    
    func setupCell(image: String, name: String, rate: Double, totalReview: Int, career: String, location: String) {
        companyImage.kf.setImage(with: URL(string: image))
        companyNameLabel.text = name
        ratingView.rating = rate
        ratingView.text = "(\(totalReview))"
        careerLabel.text = career
        locationLabel.text = location
    }
    
    func fillDataTest (avatar: String, name: String, rate: Double) {
        companyImage.image = UIImage(named: avatar)
        companyNameLabel.text = name
        ratingView.rating = rate
        ratingView.text = "(5)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
