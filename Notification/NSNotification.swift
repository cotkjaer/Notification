//
//  NSNotification.swift
//  Silverback
//
//  Created by Christian Otkjær on 02/10/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation

public func postNotificationNamed(name: String, object: AnyObject? = nil, center: NSNotificationCenter = NSNotificationCenter.defaultCenter())
{
    center.postNotificationName(name, object: object)
    
//    center.postNotificationName(<#T##aName: String##String#>, object: <#T##AnyObject?#>, userInfo: <#T##[NSObject : AnyObject]?#>)
}
