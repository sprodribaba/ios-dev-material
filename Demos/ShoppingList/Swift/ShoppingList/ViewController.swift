//
//  ViewController.swift
//  ShoppingList
//
//  Created by Sasa Prodribaba on 25/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemsTableView: UITableView!
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Method called when user taps on Add button (Action connected to button via outlet)
    @IBAction func addButtonTouchUpInside(_ sender: UIButton) {
        if let item = itemNameTextField.text {
            items.append(item)
            itemNameTextField.text = ""
            itemsTableView.reloadData()
        }
    }
    
    // MARK: - UITableViewDataSource Methods
    
    // Returns a cell object on which we set the text property (ReuseIdentifier is set in storyboard)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

}

