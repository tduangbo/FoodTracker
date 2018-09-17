//
//  Meal.swift
//  FoodTracker
//
//  Created by Thongphanh Duangboudda on 9/13/18.
//  Copyright © 2018 Thongphanh Duangboudda. All rights reserved.
//

import UIKit
import os.log


class Meal: NSObject, NSCoding{
   
    
    // Mark: Properties
    

    
    var name: String
    var photo: UIImage?
    var rating: Int
    //Mark: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    // Mark: Types
    struct PropertyKey {
        //
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        
        
    }
    
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
    // Mark: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // the name is require. If we cannot decode a name string, the initializeer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else{
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        //Because of photo is an optional property of Meal, just condition cast
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage

        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // must call designated initializer
        
        self.init(name: name, photo: photo, rating: rating)
        
    }
}







