//
//  DetailsViewController.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 11/1/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var taskDetailsTitle: UILabel!
    
    @IBOutlet weak var taskDetailsDescription: UILabel!
    
    @IBOutlet weak var taskDetailsCompletionDate: UILabel!
    
    
    @IBOutlet weak var completeTaskSwitch: UISwitch!
    
    @IBOutlet weak var taskImage: UIImageView!
    
    
    var taskDetails: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskDetailsTitle.text = taskDetails.title
        
        taskDetailsDescription.text = taskDetails.details
        
  
        
        
        if taskDetails.taskStatus == true {
            completeTaskSwitch.isOn = true
        } else {
            completeTaskSwitch.isOn = false
        }
        
        taskImage.image = taskDetails.taskPhoto
        
    }
    
    
    @IBAction func completeSwitchChanged(_ sender: Any) {
        if completeTaskSwitch.isOn {
            taskDetails.taskStatus = true
        } else {
            taskDetails.taskStatus = false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            TaskViewController {
            // We need to pass through the Task that we'll be editing.
            destination.currentTask = taskDetails
            
            
        }
    }
    
    
    
    
    // SEGUES
    @IBAction func backButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
        
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
        
    }
    
    
    
}
