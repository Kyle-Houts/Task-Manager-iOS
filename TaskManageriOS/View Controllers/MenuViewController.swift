//
//  ViewController.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 10/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    // The labels for the menu tableView
    let menuOptionsArray = ["Create A New Task", "Show Tasks"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    // Sets number of rows in the menu tableView to the number in the array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptionsArray.count
    }
    
    
    
    // Assigns menuOptionsArray to the tableView cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.menuOptionLabel?.text = menuOptionsArray[indexPath.row]
        return cell
    }
    
    
    
    // Sets the segues for each cell in the menu tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            // Create a new Task
            self.performSegue(withIdentifier: "addTaskScreen", sender: self)

            
        case 1:
            // Show  Tasks
            self.performSegue(withIdentifier: "showTasks", sender: self)
            
            
        default:
            print("Unprepared index")
        }
    }
    
    
    
    
    // Unwind Segue to Menu
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
    
}

