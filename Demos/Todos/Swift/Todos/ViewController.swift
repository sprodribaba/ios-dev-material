//
//  ViewController.swift
//  Todos
//
//  Created by Sasa Prodribaba on 25/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataSourceDelegate {

    @IBOutlet weak var todosTableView: UITableView!
    
    var dataSource: TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set external data source for the tableView
        dataSource = TableViewDataSource()
        todosTableView.dataSource = dataSource
        
        // Set ViewController to be the delegate of TableViewDataSource class
        dataSource?.dataSourceDelegate = self
    }

    func didReceiveData() {
        // Reload contents of tableView from main thread
        DispatchQueue.main.async {
            self.todosTableView.reloadData()
        }
    }
}

