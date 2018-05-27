//
//  Item.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 25/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public protocol Constrictable {}

extension UIView: Constrictable {}
extension UIViewController: Constrictable {}




public enum Guide {
    case safe(NSLayoutAttribute)
    case attribute(NSLayoutAttribute)
}

public enum Item {
    case vc(UIViewController, Guide)
    case v(UIView, Guide)
    
    /**
     Decides if the item to apply a constraint should be an safeArea or not.

     - parameters:
     - view: UIView to validate if it's to apply constraints to itself or its safeArea
     - withinSafeArea: Bool to indicate if you want the view's safeArea.

     - returns:
     Any? containing the view sent or its safeArea.
     */
    static func object(for viewController: UIViewController,
                       attribute: NSLayoutAttribute) -> (item: Any, attribute: NSLayoutAttribute) {

        let secondItem: Any
        let finalAttribute: NSLayoutAttribute

        if #available(iOS 11.0, *) {
            secondItem = viewController.view.safeAreaLayoutGuide
            finalAttribute = attribute
            
        } else {
            switch attribute {
            case .top:
                secondItem = viewController.topLayoutGuide
                finalAttribute = .bottom
            case .topMargin:
                secondItem = viewController.topLayoutGuide
                finalAttribute = .bottomMargin
            case .bottom:
                secondItem = viewController.bottomLayoutGuide
                finalAttribute = .top
            case .bottomMargin:
                secondItem = viewController.bottomLayoutGuide
                finalAttribute = .topMargin
            case .left, .right, .leading, .trailing, .width, .height,
                 .centerX, .centerY, .lastBaseline, .firstBaseline, .leftMargin,
                 .rightMargin, .leadingMargin, .trailingMargin, .centerXWithinMargins,
                 .centerYWithinMargins, .notAnAttribute:
                secondItem = viewController.view
                finalAttribute = attribute
            }
        }

        return (secondItem, finalAttribute)
    }
    
    static func object(for view: UIView) -> Any {
        
        let secondItem: Any
        
        if #available(iOS 11.0, *) {
            secondItem = view.safeAreaLayoutGuide
            
        } else {
            secondItem = view
        }
        
        return secondItem
    }
}
