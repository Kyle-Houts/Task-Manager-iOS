//
//  EditTaskViewController.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 10/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var editTaskTitle: UITextField!
    
    @IBOutlet weak var editTaskDescription: UITextView!
    
    @IBOutlet weak var editTaskCompletionDate: UIDatePicker!
    
    @IBOutlet weak var editTaskImage: UIImageView!
    
    var taskToEdit: Task!
    
    var imagePicker = UIImagePickerController()
    
    var selectedImage: UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editTaskTitle.text = taskToEdit.title
        
        editTaskDescription.text = taskToEdit.details
        
        editTaskImage.image = taskToEdit.taskPhoto
        
        imagePicker.delegate = self
    }
    
    // Shows an error when all fields are not filled in when editing a game
    func showErrorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "You must enter in all fields to submit", preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.editTaskTitle.text = ""
            self.editTaskDescription.text = ""
        }
        
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func editButtonTapped(_ sender: Any) {
        
        
        // Shows alert if title and description are blank
        guard let title = editTaskTitle.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let taskDescription = editTaskDescription.text, taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                // Show an error and return
                showErrorAlert()
                return
        }
        
        taskToEdit.title =  editTaskTitle.text!
        taskToEdit.details = editTaskDescription.text!
        
        taskToEdit.taskStatus = false
        
        if let image = selectedImage {
            taskToEdit.taskPhoto = image
        } 
        
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
        
        
    }
    
    @IBAction func editTaskImageButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender as? UIView
            alert.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have a camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = pickedImage
            editTaskImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    // SEGUES
    
    @IBAction func showEditScreen(segue: UIStoryboardSegue) {}
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
    
    
    
    
}
