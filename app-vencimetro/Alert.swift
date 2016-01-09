//
//  Alert.swift
//  rFleckMostraNome
//
//  Created by Roberson Fleck on 10/11/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    class func DisplayInfoOKButton(title: String, message: String, actionTitle: String, controller: UIViewController) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertMessage.addAction(UIAlertAction(title:actionTitle, style: UIAlertActionStyle.Default, handler: nil))
        controller.presentViewController(alertMessage, animated: true, completion: nil)
    }
}
