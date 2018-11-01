//
//  TaskClass.swift
//  TaskManageriOS
//
//  Created by Kyle Houts on 10/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class Task {
    
    var title: String
    
    var details: String
    
    var completionDate: Date?
    
    var taskStatus: Bool
    
    
    init(title: String, details: String, taskStatus: Bool) {
        
        self.title = title
        self.details = details
        self.taskStatus = taskStatus
    }
    
    
    
    
}
