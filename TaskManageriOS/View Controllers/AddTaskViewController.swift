//
//  AddTaskViewController.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 10/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var completionDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var addTaskTitle: UITextField!
    
    @IBOutlet weak var addTaskDescription: UITextView!
    
    @IBOutlet weak var addTaskImage: UIImageView!
    
    
    @IBOutlet weak var addTaskCompletionDate: UIDatePicker!
    
    var selectedImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    
    // Shows an error when all fields are not filled in when adding a task
    func showErrorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "You must enter in all fields to submit", preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.addTaskTitle.text = ""
            self.addTaskDescription.text = ""
        }
        
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        
        guard let taskTitle = addTaskTitle.text, taskTitle.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            // Show an error and return
            showErrorAlert()
            return
        }
        
        guard let taskDescription = addTaskDescription.text, taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            // Show an error and return
            showErrorAlert()
            return
        }
        
        
        if let image = selectedImage {
            let newTask = Task(title: taskTitle, details: taskDescription, taskStatus: false, taskPhoto: image)
                    TaskManager.sharedInstance.addTask(task: newTask)
        } else {
            let newTask = Task(title: taskTitle, details: taskDescription, taskStatus: false, taskPhoto: nil)
                    TaskManager.sharedInstance.addTask(task: newTask)
        }

        
        
        
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
        
    }
    
    // Lets user choose photo for task when adding a task
    var imagePicker = UIImagePickerController()
    
    @IBAction func addTaskImageButtonTapped(_ sender: Any) {
        
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
        }
        picker.dismiss(animated: true, completion: nil)
        addTaskImage.image = selectedImage
    }
    
    
    
    
    
    
    
    
    
    
    // SEGUES
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
    }
    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
    
    
    
}
