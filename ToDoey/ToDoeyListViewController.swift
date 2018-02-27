//
//  ViewController.swift
//  ToDoey
//
//  Created by Roshni Baranwal on 27/02/18.
//  Copyright © 2018 Roshni Baranwal. All rights reserved.
//

import UIKit
//if ur super class is a UITableViewController then you do not need to inherit any protocols lyk Data Source , Delegate any
class ToDoeyListViewController: UITableViewController {

    let itemArray = ["Find Milk" , "Buy Eggs" , "Destroy Demogogron"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //populating our table view with itemArray entrys
        cell.textLabel?.text = itemArray[indexPath.row]
        //we have to return cell
        return cell
    }
    
    //MARK - TableView Delegate Methods
    //to perform operation the row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    //    print(itemArray[indexPath.row]) //to print the values present at itemArray
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark //to provide a accessoryType .checkMark to the current row
        {
            //to remove the accessoryType .checkMark of the current row
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            //to provide a accessoryType .checkMark to the current row
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true) //to deselect the row after clicking on the row so that the row would go to deselected after clicking on it
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 


}

