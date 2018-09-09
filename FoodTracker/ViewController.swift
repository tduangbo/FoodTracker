//
//  ViewController.swift
//  FoodTracker
//
//  Created by Thongphanh Duangboudda on 9/8/18.
//  Copyright © 2018 Thongphanh Duangboudda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //Mark: Properties

    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Loading App")
    
            textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Mark: UItextfield delegations
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealName.text = textField.text
        
        
    }
    
   

    // Mark: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        print("Clicked Button" )
       mealName.text = textField.text
        
    }
    
    @IBAction func selectImageFromPhotoLibary(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard
        textField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from photo libary
        let imagePickerController = UIImagePickerController()
        
        // only allow photo to be pick, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // make sure ViewController is notitied when the user picks an image.
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
        
        
    }
}

