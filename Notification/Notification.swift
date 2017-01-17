//
//  NSNotification.swift
//  Silverback
//
//  Created by Christian Otkjær on 02/10/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation

public func postNotificationNamed(_ name: String, object: AnyObject? = nil, center: NotificationCenter = NotificationCenter.default)
{
    center.post(name: Foundation.Notification.Name(rawValue: name), object: object)
}
