//
//  AddTaskViewController.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 10/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    
    
    @IBOutlet weak var completionDatePicker: UIDatePicker!
    

    @IBOutlet weak var addTaskTitle: UITextField!
    
    @IBOutlet weak var addTaskDescription: UITextView!
    
    
    
    @IBOutlet weak var addTaskCompletionDate: UIDatePicker!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        
        
        let newTask = Task(title: taskTitle, details: taskDescription, taskStatus: false)
        TaskManager.sharedInstance.addTask(task: newTask)
        
        
        
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
        
    }
    
    
    
    
    

// SEGUES
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
    }
    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    

    
    
}
