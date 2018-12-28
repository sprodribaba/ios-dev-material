//
//  Serializer.swift
//  Todos
//
//  Created by Sasa Prodribaba on 25/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

import Foundation

class Serializer {
    
    func serializeJSONObject(jsonData: Data) -> [Todo] {
        var todos = [Todo]()
        do {
            let jsonObjects = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]]
            
            if let jsonObjects = jsonObjects {
                for dict in jsonObjects {
                    let todo = Todo(dict: dict)
                    todos.append(todo)
                }
            }
        } catch {
            print("JSON Error: \(error)")
        }
        return todos
    }
}
