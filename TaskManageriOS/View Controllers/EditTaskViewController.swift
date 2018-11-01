//
//  EditTaskViewController.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 10/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    @IBOutlet weak var editTaskTitle: UITextField!
    
    @IBOutlet weak var editTaskDescription: UITextView!
    
    @IBOutlet weak var editTaskCompletionDate: UIDatePicker!
    
    
    var taskToEdit: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editTaskTitle.text = taskToEdit.title
        
        editTaskDescription.text = taskToEdit.details
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
        
        
        let editTask = Task(title: taskToEdit.title, details: taskToEdit.details, taskStatus: false)
        
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
        
        
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
