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
    
    func itemLayoutAttribute(for item: Constrictable?) -> (item: Any?, layoutAttribute: NSLayoutAttribute) {
        
        if let view = item as? UIView {
            return itemLayoutAttribute(for: view)
            
        } else  if let viewController = item as? UIViewController {
            return itemLayoutAttribute(for: viewController)
        }
        
        
        return (UIView(), .notAnAttribute)
    }
}

private extension ConstrictorAttribute {
    
    static let guidedAttributes: [ConstrictorAttribute] = [.topGuide, .bottomGuide, .rightGuide, .leftGuide,
                                                           .leadingGuide, .trailingGuide, .centerXGuide, .centerYGuide]
    static let layoutGuidedAttributes: [ConstrictorAttribute] = [.topGuide, .bottomGuide, .rightGuide, .leftGuide,
                                                                 .leadingGuide, .trailingGuide, .centerXGuide, .centerYGuide]
    
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
        case .centerX, .centerXGuide: attribute = .centerX
        case .centerY, .centerYGuide: attribute = .centerY
        case .width: attribute = .width
        case .height: attribute = .height
        case .none: attribute = .notAnAttribute
        }
        
        return (safeArea, attribute)
    }
}
