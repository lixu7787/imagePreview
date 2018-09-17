//
//  extenstion.swift
//  imagePreview
//
//  Created by 李旭 on 2018/9/17.
//  Copyright © 2018年 李旭. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    public var x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    public var y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    public var width : CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
    }
    public var height : CGFloat {
        get{
            return self.frame.size.height
        }
        set{
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    public var size : CGSize {
        get{
            return self.frame.size
        }
        set{
            var r = self.frame
            r.size = newValue
            self.frame = r
        }
    }
    public var maxX:CGFloat {
        get{
            return (self.frame.origin.x + self.frame.size.width)
        }
        
    }
    public var maxY : CGFloat {
        get{
            return self.frame.origin.y + self.frame.size.height
        }
    }
    public func removeAllSubviews(){
        if subviews.count > 0 {
            for chilren in subviews {
                chilren.removeFromSuperview()
            }
        }
    }
    
    public func responderViewController() -> UIViewController {
        var responder: UIResponder! = nil
        var next = self.superview
        while next != nil {
            responder = next?.next
            if responder.isKind(of: UIViewController.self) {
                return (responder as! UIViewController)
            }
            next = next?.superview
        }
        
        return (responder as! UIViewController)
    }
}
