//
//  ListItemTableViewController.swift
//  app-vencimetro
//
//  Created by Roberson Fleck on 12/5/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

import UIKit

protocol ListItemDelegate {
    func didAddItem(item:Item)
    func didEditItem(item:Item)
    func didRemoveItem(index:Int)
}

class ListItemTableViewController: UITableViewController, ListItemDelegate {
    var itemService:ItemService!
    //var items:Array<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemService = ItemService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.itemService.list().count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cellID = "cell"
        let row = indexPath.row
        let item:Item = self.itemService.list()[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellID)
        
        cell.textLabel!.text = item.desc
        cell.detailTextLabel!.text = item.dueDate
    
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let item:Item = self.itemService.list()[row]
        
        //Alert.DisplayInfoOKButton("Item Selecionado:", message: item.desc, actionTitle: "OK", controller: self)
        print("Item Selecionado:\(item.desc) - Vcto: \(item.dueDate)")
        
        if let navigation = self.navigationController{
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            
            let edit:EditItemViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("EditItemViewController") as! EditItemViewController
            
            edit.action = "edit"
            edit.delegate = self
            edit.item = item
            navigation.pushViewController(edit, animated: true)
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            didRemoveItem(indexPath.row)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "addItem") {
            let edit:EditItemViewController = segue.destinationViewController as!EditItemViewController
            edit.action = "add"
            edit.delegate = self
        }
    }
    
    func didAddItem(item:Item) {
        self.itemService.add(item)
        tableView.reloadData()
    }
    
    func didEditItem(item:Item) {
        self.itemService.edit(item)
        tableView.reloadData()
    }
    
    func didRemoveItem(index:Int) {
        self.itemService.remove(index)
        tableView.reloadData()
    }
}
