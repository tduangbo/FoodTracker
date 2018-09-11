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
    // Mark: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // dismiss the picker if user canceled
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
    // the info dictionary may contain multiple representations of the image. we want to use the original
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provide the following: \(info)")
        }
     // set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        // dismiss the picker
        dismiss(animated: true, completion: nil)
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

