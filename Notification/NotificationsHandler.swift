//
//  NotificationsHandler.swift
//  Silverback
//
//  Created by Christian Otkjær on 02/10/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation

/** A handler class to ease the book-keeping associated with adding closure-based notification handling.
 */
open class NotificationsHandler
{
    // The tokens managed by this manager
    private var observerTokens = Array<AnyObject>()
    
    
    private let notificationCenter: NotificationCenter
    
    public required init(notificationCenter: NotificationCenter = NotificationCenter.default)
    {
        self.notificationCenter = notificationCenter
    }
    
    deinit
    {
        deregisterAll()
    }
    
    /**
     remove all handler registrations
     */
    open func deregisterAll()
    {
        while !observerTokens.isEmpty
        {
            notificationCenter.removeObserver(observerTokens.removeLast())
        }
    }
    
    /**
     register a handler (closure) for a given notification type
     */
    open func registerHandlerForNotification(_ name: NSNotification.Name? = nil,
                                             object: AnyObject? = nil,
                                             queue: OperationQueue? = nil,
                                             handler: @escaping ((_ notification: Foundation.Notification) -> ()))
    {
        observerTokens.append(notificationCenter.addObserver(forName: name, object: object, queue: queue, using: { handler($0) }))
    }
    
    open func onAny(from object: AnyObject, perform: @escaping (() -> ()))
    {
        registerHandlerForNotification(nil, object: object, queue: nil) { _ in perform() }
    }
    
    open func on(_ notificationName: NSNotification.Name, from object: AnyObject? = nil, perform: @escaping (() -> ()))
    {
        registerHandlerForNotification(notificationName, object: object, queue: nil) { _ in perform() }
    }
    
    open func when(_ notificationName: NSNotification.Name, with object: AnyObject? = nil, perform: @escaping (() -> ()))
    {
        registerHandlerForNotification(notificationName, object: object, queue: nil) { _ in perform() }
    }
    
    open func when<T:AnyObject>(_ notificationName: NSNotification.Name, with object: AnyObject? = nil, perform: @escaping ((T) -> ()))
    {
        registerHandlerForNotification(notificationName, object: object) { (notification) -> () in
            if let t = notification.object as? T
            {
                perform(t)
            }
        }
    }
}
