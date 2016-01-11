//
//  EditItemViewController.swift
//  app-vencimetro
//
//  Created by Roberson Fleck on 12/5/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

import UIKit

class EditItemViewController: UITableViewController  {
    var action:String!
    var item:Item!
    var delegate:ListItemDelegate!
    
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dueField: UITextField!
    
    @IBAction func salvarItem(sender: AnyObject) {
        self.item.desc = self.descField.text
        self.item.dueDate = self.dueField.text
        
        if action == "add" {
            delegate.didAddItem(item)
        }
        
        if action == "edit" {
            delegate.didEditItem(item)
        }
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
        //print("Salvar Novo Item: Desc: \(descField.text) - Date: \(dueField.text)")
    }
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
        
        if action == "add" {
            item = Item(id:1, desc:"DESC1", dueDate: "12/12/2015")
            item.id = random()
        }
        
        if action == "edit" {
            descField.text = item.desc
            dueField.text = item.dueDate
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
