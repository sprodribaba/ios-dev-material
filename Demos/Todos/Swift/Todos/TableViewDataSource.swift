//
//  TableViewDataSource.swift
//  Todos
//
//  Created by Sasa Prodribaba on 25/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

import UIKit

protocol DataSourceDelegate {
    func didReceiveData()
}

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var dataSourceDelegate: DataSourceDelegate?
    
    var todos = [Todo]()
    
    override init() {
        super.init()
        
        let fetcher = Fetcher()
        fetcher.fetchWithResult {
            result in
            self.todos = result
            self.dataSourceDelegate?.didReceiveData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.todoCellIdentifier, for: indexPath)
        cell.textLabel?.text = todos[indexPath.row].title
        cell.detailTextLabel?.text = "\(todos[indexPath.row].completed ? "Completed" : "Due")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
}
