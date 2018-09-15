//
//  Meal.swift
//  FoodTracker
//
//  Created by Thongphanh Duangboudda on 9/13/18.
//  Copyright © 2018 Thongphanh Duangboudda. All rights reserved.
//

import UIKit

class Meal{
    // Mark: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // Mark: initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialization should fail if ther is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}
