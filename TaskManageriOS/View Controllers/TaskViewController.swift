//
//  TaskViewController.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 10/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterTasks()
        
    }
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var completionSegmentedController: UISegmentedControl!
    
    var currentTask: Task!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.completedtaskArray.count
    }
    
    
    // Assigns taskArray to task tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        
        let taskAtIndex = TaskManager.sharedInstance.getTaskIndex(at: indexPath.row)
        
        // Task title
        cell.taskTitleLabel?.text = "\(taskAtIndex.title)"
        
        //        // Task details
        //        cell.taskDetailTextView?.text = "\(taskAtIndex.details)"
        
        
        // Task statusImage
        if  taskAtIndex.taskStatus == true {
            cell.taskStatusImage?.image = UIImage(named: "complete.jpeg")
        } else {
            cell.taskStatusImage?.image = UIImage(named: "incomplete.jpeg")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func filterTasks() {
        //Set the completedTasks array equal to the filtered task array
        switch completionSegmentedController.selectedSegmentIndex {
        case 0:
            TaskManager.sharedInstance.completedtaskArray = TaskManager.sharedInstance.taskArray.filter({ (task) -> Bool in
                return task.taskStatus == false
            })
        case 1:
            TaskManager.sharedInstance.completedtaskArray = TaskManager.sharedInstance.taskArray.filter({ (task) -> Bool in
                return task.taskStatus == true
            })
        case 2:
            TaskManager.sharedInstance.completedtaskArray = TaskManager.sharedInstance.taskArray
        default:
            return
        }
        taskTableView.reloadData()
    }
    
    
    
    @IBAction func segmentedControllerChange(_ sender: Any) {
        filterTasks()
    }
    
    // Keeps changes that edit a task
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            EditTaskViewController {
            // We need to pass through the Game that we'll be editing.
            destination.taskToEdit = currentTask
        }
        if let destination = segue.destination as?
            DetailsViewController {
            // We need to pass through the Game that we'll be editing.
            destination.taskDetails = currentTask
        }
    }
    

    
    // Gives slide options for task tableView
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // This allows us to return an array of actions that the row will have (if any)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            
            // Remove the game at the current index from the game array
            TaskManager.sharedInstance.removeTask(at: indexPath.row)
            // Delete the row from the table view at the current index path
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.currentTask = TaskManager.sharedInstance.getTaskIndex(at: indexPath.row)
            self.performSegue(withIdentifier: "showEditScreen", sender: self)
        }
        
        
//        let markCompleteAction = UITableViewRowAction(style: .normal, title: "Mark Complete/Incomplete") { _, _ in
//            TaskManager.sharedInstance.markComplete(at: indexPath.row)
//            tableView.reloadRows(at: [indexPath], with: .fade)
//        }
        
        let descriptionAction = UITableViewRowAction(style: .normal, title: "Description") { _, _ in
            self.currentTask = TaskManager.sharedInstance.getTaskIndex(at: indexPath.row)
            self.performSegue(withIdentifier: "showDetailsScreen", sender: self)
        }

        
        descriptionAction.backgroundColor = UIColor.magenta
        
        showEditScreenAction.backgroundColor = UIColor.purple
        
        return [deleteAction, showEditScreenAction, descriptionAction]
    }
    
    
    
    
    
    
    // SEGUES
    
    // Goes back to the menu screen with menu button tapped
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
    @IBAction func showTasks(segue: UIStoryboardSegue) {}
    
    // Unwind Segue to Tasks
    @IBAction func unwindToTasks(segue: UIStoryboardSegue) {}
    
    
}
