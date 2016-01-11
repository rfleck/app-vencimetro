//
//  ItemService.swift
//  app-vencimetro
//
//  Created by Roberson Fleck on 12/5/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

import Foundation

class ItemService {
    private var items:Array<Item>!
    
    init() {
        items = []
    }
    
    func list() -> Array<Item> {
        let data = NSUserDefaults.standardUserDefaults().objectForKey("items") as? NSData
        
        if let data = data {
            self.items = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Item]
        }
        return self.items
    }
    
    func add(item:Item) -> Void {
        self.items.append(item)
        self.saveItemsInLocalStorage()
    }
    
    func edit(item:Item) -> Void {
        for aux:Item in self.items {
            if aux.id == item.id {
                aux.desc = item.desc
                aux.dueDate = item.dueDate
                break
            }
        }
        self.saveItemsInLocalStorage()
    }
    
    func remove(index:Int) -> Void {
        self.items.removeAtIndex(index)
        self.saveItemsInLocalStorage()
    }
    
    func saveItemsInLocalStorage() {
        let data = NSKeyedArchiver.archivedDataWithRootObject(items)
        
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "items")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}
