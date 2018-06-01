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
}

extension ConstrictorAttribute {

    static let guidedAttributes: [ConstrictorAttribute] = [.topGuide, .bottomGuide, .rightGuide, .leftGuide,
                                                           .leadingGuide, .trailingGuide, .centerXGuide, .centerYGuide]
    
    /**
     Converts ConstrictorAttribute to NSLayoutAttribute based on an optional Constrictable
     
     - parameters:
        - item: Optional Constrictable's to extract NSLayoutAttribute from.
     
     - returns:
     Tuple containing the item to apply a constraint and its attribute.
     */
    
    func itemLayoutAttribute(for item: Constrictable?) -> (item: Any?, layoutAttribute: NSLayoutAttribute) {
        
        if let view = item as? UIView {
            return itemLayoutAttribute(for: view)
            
        } else if let viewController = item as? UIViewController {
            return itemLayoutAttribute(for: viewController)
            
        } else if let layoutGuide = item as? UILayoutGuide {
            return itemLayoutAttribute(for: layoutGuide)
        }
        
        return (item, .notAnAttribute)
    }
}

private extension ConstrictorAttribute {

    /**
     Converts ConstrictorAttribute to NSLayoutAttribute based on an UILayoutGuite
     
     - parameters:
     - layoutGuide: UILayoutGuide to extract NSLayoutAttribute from.
     
     - returns:
     Tuple containing the item to apply a constraint and its attribute.
     */
    
    func itemLayoutAttribute(for layoutGuide: UILayoutGuide) -> (item: Any?, layoutAttribute: NSLayoutAttribute) {
        
        let safeArea = layoutGuide
        let attribute: NSLayoutAttribute
 
        switch self {
        case .top, .topGuide: attribute = .top
        case .bottom, .bottomGuide: attribute = .bottom
        case .right, .rightGuide: attribute = .right
        case .left, .leftGuide: attribute = .left
        case .leading, .leadingGuide: attribute = .leading
        case .trailing, .trailingGuide: attribute = .trailing
        case .centerX, .centerXGuide: attribute = .centerX
        case .centerY, .centerYGuide: attribute = .centerY
        case .width: attribute = .width
        case .height: attribute = .height
        case .none: attribute = .notAnAttribute
        }
        
        return (safeArea, attribute)
    }
    
    /**
     Converts ConstrictorAttribute to NSLayoutAttribute based on an UIView
     
     - parameters:
        - view: UIView to extract NSLayoutAttribute from.
     
     - returns:
     Tuple containing the item to apply a constraint and its attribute.
     */
    
    func itemLayoutAttribute(for view: UIView) -> (item: Any?, layoutAttribute: NSLayoutAttribute) {
        
        let safeArea: Any
        let attribute: NSLayoutAttribute
        
        if #available(iOS 11.0, *), ConstrictorAttribute.guidedAttributes.contains(self) {
            safeArea = view.safeAreaLayoutGuide
        } else {
            safeArea = view
        }
        
        switch self {
        case .top, .topGuide: attribute = .top
        case .bottom, .bottomGuide: attribute = .bottom
        case .right, .rightGuide: attribute = .right
        case .left, .leftGuide: attribute = .left
        case .leading, .leadingGuide: attribute = .leading
        case .trailing, .trailingGuide: attribute = .trailing
        case .centerX, .centerXGuide: attribute = .centerX
        case .centerY, .centerYGuide: attribute = .centerY
        case .width: attribute = .width
        case .height: attribute = .height
        case .none: attribute = .notAnAttribute
        }
        
        return (safeArea, attribute)
    }
    
    /**
     Converts ConstrictorAttribute to NSLayoutAttribute based on an UIViewController
     
     - parameters:
     - viewController: UIViewController to extract NSLayoutAttribute from.
     
     - returns:
     Tuple containing the item to apply a constraint and its attribute.
     */
    
    func itemLayoutAttribute(for viewController: UIViewController) -> (item: Any?, layoutAttribute: NSLayoutAttribute) {
        
        var safeArea: Any
        let attribute: NSLayoutAttribute
        let isIOS11: Bool
        
        if #available(iOS 11.0, *), ConstrictorAttribute.guidedAttributes.contains(self) {
            safeArea = viewController.view.safeAreaLayoutGuide
            isIOS11 = true
        } else {
            safeArea = viewController.view
            isIOS11 = false
        }
        
        switch self {
        case .top: attribute = .top
        case .topGuide:
            safeArea = isIOS11 ? safeArea : viewController.topLayoutGuide
            attribute = isIOS11 ? .top : .bottom
    
        case .bottom: attribute = .bottom
        case .bottomGuide:
            safeArea = isIOS11 ? safeArea : viewController.bottomLayoutGuide
            attribute = isIOS11 ? .bottom : .top
            
        case .right, .rightGuide: attribute = .right
        case .left, .leftGuide: attribute = .left
        case .leading, .leadingGuide: attribute = .leading
        case .trailing, .trailingGuide: attribute = .trailing
        case .centerX:  attribute = .centerX
        case .centerXGuide:
            safeArea = isIOS11 ? safeArea : safeLayoutGuide(for: viewController)
            attribute = .centerX
            
        case .centerY: attribute = .centerY
        case .centerYGuide:
            safeArea = isIOS11 ? safeArea : safeLayoutGuide(for: viewController)
            attribute = .centerY
            
        case .width: attribute = .width
        case .height: attribute = .height
        case .none: attribute = .notAnAttribute
        }
        
        return (safeArea, attribute)
    }
    
    /**
     Get an UILayoutGuide pinned to the viewController's safe edges.
     
     - parameters:
     - viewController: UIViewController to get an UILayoutGuide pinned its edges
     
     - returns:
     Safe UILayoutGuide.
     */
    
    func safeLayoutGuide(for viewController: UIViewController) -> UILayoutGuide {
        
        let layoutGuide = UILayoutGuide()
        viewController.view.addLayoutGuide(layoutGuide)

        NSLayoutConstraint.activate(
            [NSLayoutConstraint(item: layoutGuide, attribute: .top, relatedBy: .equal, toItem: viewController.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
             NSLayoutConstraint(item: layoutGuide, attribute: .bottom, relatedBy: .equal, toItem: viewController.bottomLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
             NSLayoutConstraint(item: layoutGuide, attribute: .leading, relatedBy: .equal, toItem: viewController.view, attribute: .leading, multiplier: 1, constant: 0),
             NSLayoutConstraint(item: layoutGuide, attribute: .trailing, relatedBy: .equal, toItem: viewController.view, attribute: .trailing, multiplier: 1, constant: 0)]
        )
        
        return layoutGuide
    }
}
