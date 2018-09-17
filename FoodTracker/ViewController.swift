//
//  ViewController.swift
//  FoodTracker
//
//  Created by Thongphanh Duangboudda on 9/8/18.
//  Copyright © 2018 Thongphanh Duangboudda. All rights reserved.
//

import UIKit
import os.log


class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //Mark: Properties

    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    @IBOutlet weak var ratingControl: RatingControll!
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Loading App")
    
            textField.delegate = self
        
        //set up views if editing an existing Meal
        
        if let meal = meal{
            navigationItem.title = meal.name
            textField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
            
        }
        
        // Enable the saveButton only if the text field has a valid Meal name
        
        updateSaveButtonState()
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable saveButton while editing
        
        saveButton.isEnabled = false
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        mealName.text = textField.text
        
        updateSaveButtonState()
        navigationItem.title = textField.text
        
        
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
    
    //Mark: Navigations
    
    
    //This method lets you configure a view controller before it's presented
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //to do
        super.prepare(for: segue, sender: sender)
        //Configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else{
            os_log("the save button was not pressed, cancelling" , log: OSLog.default, type: .debug)
            return
        }
        
        let name = textField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        
        // Set the meal to be passed to MealTableViewControl after the unwind segue
        
        meal = Meal(name: name, photo: photo, rating: rating)
        
        
    }
    //Mark: Navigation
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Depending on style of presentation (modal or push presentaton, this view controller needs to be dismissed in two different ways
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            
            owningNavigationController.popViewController(animated: true)
        }else{
            fatalError("The ViewController is not inside a naviation controller.")
            
        }
        
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

    //Mark: Private Methods
    
    private func updateSaveButtonState(){
        //Disable the saveButton if textField is empty
        
        let text = textField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        
        
    }
}

