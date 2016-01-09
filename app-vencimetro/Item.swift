//
//  Item.swift
//  app-vencimetro
//
//  Created by Roberson Fleck on 12/5/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

import Foundation

class Item:NSObject {
    var id:Int!
    var desc:String!
    var dueDate:String!
    
    init(id:Int!, desc:String, dueDate:String){
        self.id = id
        self.desc = desc
        self.dueDate = dueDate
    }
    
    func encodeWithCoder(aCoder: NSCoder!){
        aCoder.encodeInteger(id, forKey: "id")
        aCoder.encodeObject(desc, forKey: "desc")
        aCoder.encodeObject(dueDate, forKey: "dueDate")
    }
    
    required convenience init(coder aDecoder:NSCoder){
        let id = aDecoder.decodeIntegerForKey("id")
        let desc = aDecoder.decodeObjectForKey("desc") as! String
        let dueDate = aDecoder.decodeObjectForKey("dueDate") as! String
        
        self.init(id: id, desc: desc, dueDate: dueDate)
    }
}