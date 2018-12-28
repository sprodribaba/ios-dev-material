//
//  Todo.swift
//  Todos
//
//  Created by Sasa Prodribaba on 25/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

import Foundation

class Todo {
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool = false
    
    init(dict: Dictionary<String, Any>) {
        // Here it's assumed that these values actually exist in the dict (prone to crashing)
        self.id = dict["id"] as! Int
        self.userId = dict["userId"] as! Int
        self.title = dict["title"] as! String
        
        // To make the above more safe you can write as follows
        if let completed = dict["completed"] as? Bool {
            self.completed = completed
        }
    }
}
