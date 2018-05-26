//
//  ConstrictorAttribute.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 26/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

public enum ConstrictorAttribute {
    case top
    case topGuide
    
    case bottom
    case bottomGuide
    
    case right
    case rightGuide
    
    case left
    case leftGuide
    
    case leading
    case leadingGuide
    
    
    case trailing
    case trailingGuide
    
    case centerX
    case centerXGuide
    
    case centerY
    case centerYGuide
    
    case width
    case height
    
    case none
    
    func itemLayoutAttribute(for view: UIView) -> (item: Any, layoutAttribute: NSLayoutAttribute) {
        
        return (UIView(), .notAnAttribute)
    }
    
    func itemLayoutAttribute(for viewController: UIViewController) -> (item: Any, layoutAttribute: NSLayoutAttribute) {
        
        return (UIView(), .notAnAttribute)
    }
}
