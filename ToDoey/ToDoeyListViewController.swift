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

    var itemArray = ["Find Milk" , "Buy Eggs" , "Destroy Demogogron"]
    
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
    
    
    
    // MARK - Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
       //alert button creartion
        let alert = UIAlertController(title: "Add New TodDoey Item" , message: "" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks th Add button on UIAlert
           self.itemArray.append(textField.text!) //append the values into the itemArray
            self.tableView.reloadData() //it will reload the textField and save the new data to the itemArray
        }
        //adding a textField to our alert message
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item" //giving the placeholder to the text field
            textField = alertTextField // alertTextField is the local Variable inside the closure so we are creating a local textField and assing the value of alertTextField to make it global in function
            
      
        }
       alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 


}

