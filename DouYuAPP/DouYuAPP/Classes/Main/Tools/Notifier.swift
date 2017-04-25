//
//  Notifier.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/14.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import Foundation

public protocol Notifier {
    associatedtype Notification: RawRepresentable
}

public extension Notifier where Notification.RawValue == String {
    
    private static func nameFor(Notification notification: Notification) -> String {
        return "\(self).\(notification.rawValue)"
    }
    
    // post
    static func postNotification(notification: Notification, object: AnyObject? = nil, userInfo: [String : AnyObject]? = nil) {
        let name = nameFor(Notification: notification)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: object, userInfo: userInfo)
        
    }
    
    // Add
    
    static func addObserver(observer: AnyObject, selector: Selector, notification: Notification) {
        let name = nameFor(Notification: notification)
        
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: name), object: nil)
    }
    
    // Remove
    
    static func removeObserver(observer: AnyObject, notification: Notification, object: AnyObject? = nil) {
        let name = nameFor(Notification: notification)
        
        NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(rawValue: name), object: object)
    }
}








