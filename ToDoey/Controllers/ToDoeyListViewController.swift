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

    var itemArray = [Item]()
    //use userDefault
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //to persist the data
        
        let newItem = Item()
        newItem.title = "Find Milk"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Pajamas"
        itemArray.append(newItem2)

        let newItem3 = Item()
        newItem3.title = "Find Meh"
        itemArray.append(newItem3)

        
    if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
       itemArray = items
   }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item  = itemArray[indexPath.row]
        //populating our table view with itemArray entry now it is returning the Item() object so we tap into its title property
        cell.textLabel?.text = item.title
        
        //Ternary OPerator ==
        //value.condition ? true : false
        cell.accessoryType = item.done ? .checkmark : .none
  
        
        //we have to return cell
        return cell
    }
    
    //MARK - TableView Delegate Methods
    //to perform operation the row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    //    print(itemArray[indexPath.row]) //to print the values present at itemArray
        
        //it changes the the current property of itemArray to the opp (!) of it if done is true it will make it false and vice versa
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark //to provide a accessoryType .checkMark to the current row
        {
            //to remove the accessoryType .checkMark of the current row
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            //to provide a accessoryType .checkMark to the current row
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.reloadData() //it forces tableView to call its dataSource again to call reloadData
        
        tableView.deselectRow(at: indexPath, animated: true) //to deselect the row after clicking on the row so that the row would go to deselected after clicking on it
    }
    
    
    
    // MARK - Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
       //alert button creartion
        let alert = UIAlertController(title: "Add New TodDoey Item" , message: "" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //have to create anew item
            let newItem = Item()
            newItem.title = textField.text!
            
            //what will happen once the user clicks th Add button on UIAlert
           self.itemArray.append(newItem) //append the values of newItem into the itemArray
            
            //saving that updated array in my UserDefault
          self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
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

