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
    
    
    
    
    
    var taskDetails: Task!

    override func viewDidLoad() {
        super.viewDidLoad()

        taskDetailsTitle.text = taskDetails.title
        
        taskDetailsDescription.text = taskDetails.details
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
    self.performSegue(withIdentifier: "showTasks", sender: self)
    
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
    self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    
    }
    
    

}
