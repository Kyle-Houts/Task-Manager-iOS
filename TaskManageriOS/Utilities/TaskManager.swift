//
//  TaskManager.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 10/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class TaskManager {
    
    // Shared instance of the TaskManager class
    static let sharedInstance = TaskManager()
    
    
    // We are creating a private initializer so that no instance of this class can be made anywhere else
    private init() {
        
    }
    
    
    // Array of default tasks
    var taskArray: [Task] = [Task(title: "Make Dinner", details: "Cook pot roast", taskStatus: false), Task(title: "Mow Lawn", details: "Mow this weekend", taskStatus: false), Task(title: "Vacuum house", details: "Especially the living room", taskStatus: true)]
    
    var completedtaskArray: [Task] = []
    
    
    
    // Function to get the number of tasks we have
    func getTaskCount() -> Int {
        return taskArray.count
    }
    
    
    // Function to return a task at a specific index
    func getTaskIndex(at index: Int) -> Task {
        return completedtaskArray[index]
    }
    
    
    // Function to add a task
    func addTask(task: Task) {
        
        taskArray.append(task)
        
    }
    
    // Function to delete a task
    func removeTask(at index: Int) {
        
        taskArray.remove(at: index)
        
    }
    
    // Function to mark task complete
    func markComplete(at index: Int) {
        
        let taskForIndex = taskArray[index]
        
        if taskForIndex.taskStatus == true {
            taskForIndex.taskStatus = false
        } else {
            taskForIndex.taskStatus = true
        }
        
        
        
        
    }
}
