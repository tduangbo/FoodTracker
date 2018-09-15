//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Thongphanh Duangboudda on 9/13/18.
//  Copyright © 2018 Thongphanh Duangboudda. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    // Mark: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControll!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
