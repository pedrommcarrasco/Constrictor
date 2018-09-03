//
//  ItemLayoutAttributesDecoder.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 31/08/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: - ItemLayoutAttributeDecoder
struct ItemLayoutAttributesDecoder {

    // MARK: Internal Functions

    /**
     Converts ConstrictorAttribute to NSLayoutAttribute based on an optional Constrictable

     - parameters:
     - item: Optional Constrictable's to extract NSLayoutAttribute from.

     - returns:
     Tuple containing the item to apply a constraint and its attribute.
     */

    static func itemLayoutAttribute(for item: Constrictable?,
                                    with attribute: ConstrictorAttribute,
                                    and constant: Constant) -> (item: Any?, layoutAttribute: NSLayoutAttribute, constant: CGFloat) {

        var itemLayoutAttributeTuple: (item: Any?, layoutAttribute: NSLayoutAttribute, constant: CGFloat) = (nil, .notAnAttribute, 0.0)

        if let view = item as? UIView {
            itemLayoutAttributeTuple = itemLayoutAttribute(view: view, with: attribute, and: constant)

        } else if let viewController = item as? UIViewController {
            itemLayoutAttributeTuple = itemLayoutAttribute(viewController: viewController, with: attribute, and: constant)

        } else if let layoutGuide = item as? UILayoutGuide {
            itemLayoutAttributeTuple = itemLayoutAttribute(layoutGuide: layoutGuide, with: attribute, and: constant)
        }

        return itemLayoutAttributeTuple
    }
}


// MARK: - Private Functions
private extension ItemLayoutAttributesDecoder {

    /**
     Converts ConstrictorAttribute to NSLayoutAttribute based on an UILayoutGuite

     - parameters:
     - layoutGuide: UILayoutGuide to extract NSLayoutAttribute from.

     - returns:
     Tuple containing the item to apply a constraint and its attribute.
     */

    static func itemLayoutAttribute(layoutGuide: UILayoutGuide,
                                    with attribute: ConstrictorAttribute,
                                    and constantStruct: Constant) -> (item: Any?, layoutAttribute: NSLayoutAttribute, constant: CGFloat) {

        let attributeAndConstantTuple = defaultLayoutAttributeAndConstant(for: attribute, with: constantStruct)

        return (layoutGuide, attributeAndConstantTuple.attribute, attributeAndConstantTuple.constant)
    }

    /**
     Converts ConstrictorAttribute to NSLayoutAttribute based on an UIView

     - parameters:
     - view: UIView to extract NSLayoutAttribute from.

     - returns:
     Tuple containing the item to apply a constraint and its attribute.
     */

    static func itemLayoutAttribute(view: UIView,
                                    with attribute: ConstrictorAttribute,
                                    and constantStruct: Constant) -> (item: Any?, layoutAttribute: NSLayoutAttribute, constant: CGFloat) {

        let safeArea: Any

        if #available(iOS 11.0, *), ConstrictorAttribute.guidedAttributes.contains(attribute) {
            safeArea = view.safeAreaLayoutGuide
        } else {
            safeArea = view
        }

        let attributeAndConstantTuple = defaultLayoutAttributeAndConstant(for: attribute, with: constantStruct)

        return (safeArea, attributeAndConstantTuple.attribute, attributeAndConstantTuple.constant)
    }

    /**
     Converts ConstrictorAttribute to NSLayoutAttribute based on an UIViewController

     - parameters:
     - viewController: UIViewController to extract NSLayoutAttribute from.

     - returns:
     Tuple containing the item to apply a constraint and its attribute.
     */

    static func itemLayoutAttribute(viewController: UIViewController,
                                    with constrictorAttribute: ConstrictorAttribute,
                                    and constantStruct: Constant) -> (item: Any?, layoutAttribute: NSLayoutAttribute, constant: CGFloat) {

        var safeArea: Any
        let attribute: NSLayoutAttribute
        let isIOS11: Bool
        let constant: CGFloat

        if #available(iOS 11.0, *), ConstrictorAttribute.guidedAttributes.contains(constrictorAttribute) {
            safeArea = viewController.view.safeAreaLayoutGuide
            isIOS11 = true
        } else {
            safeArea = viewController.view
            isIOS11 = false
        }

        switch constrictorAttribute {
        case .top:
            attribute = .top
            constant = constantStruct.top

        case .topGuide:
            safeArea = isIOS11 ? safeArea : viewController.topLayoutGuide
            attribute = isIOS11 ? .top : .bottom
            constant = constantStruct.top

        case .bottom:
            attribute = .bottom
            constant = -constantStruct.bottom

        case .bottomGuide:
            safeArea = isIOS11 ? safeArea : viewController.bottomLayoutGuide
            attribute = isIOS11 ? .bottom : .top
            constant = -constantStruct.bottom

        case .right, .rightGuide:
            attribute = .right
            constant = -constantStruct.right

        case .left, .leftGuide:
            attribute = .left
            constant = constantStruct.left

        case .leading, .leadingGuide:
            attribute = .leading
            constant = constantStruct.leading

        case .trailing, .trailingGuide:
            attribute = .trailing
            constant = -constantStruct.trailing

        case .centerX:
            attribute = .centerX
            constant = constantStruct.x

        case .centerXGuide:
            safeArea = isIOS11 ? safeArea : safeLayoutGuide(for: viewController)
            attribute = .centerX
            constant = constantStruct.x

        case .centerY:
            attribute = .centerY
            constant = constantStruct.y

        case .centerYGuide:
            safeArea = isIOS11 ? safeArea : safeLayoutGuide(for: viewController)
            attribute = .centerY
            constant = constantStruct.y

        case .width:
            attribute = .width
            constant = constantStruct.width

        case .height:
            attribute = .height
            constant = constantStruct.height

        case .none:
            attribute = .notAnAttribute
            constant = 0.0
        }

        return (safeArea, attribute, constant)
    }
}

// MARK: - Utils
private extension ItemLayoutAttributesDecoder {

    static func defaultLayoutAttributeAndConstant(for constrictorAttribute: ConstrictorAttribute,
                                                  with constantStruct: Constant) -> (attribute: NSLayoutAttribute, constant: CGFloat) {

        let attribute: NSLayoutAttribute
        let constant: CGFloat

        switch constrictorAttribute {
        case .top, .topGuide:
            attribute = .top
            constant = constantStruct.top

        case .bottom, .bottomGuide:
            attribute = .bottom
            constant = -constantStruct.bottom

        case .right, .rightGuide:
            attribute = .right
            constant = -constantStruct.right

        case .left, .leftGuide:
            attribute = .left
            constant = constantStruct.left

        case .leading, .leadingGuide:
            attribute = .leading
            constant = constantStruct.leading

        case .trailing, .trailingGuide:
            attribute = .trailing
            constant = -constantStruct.trailing

        case .centerX, .centerXGuide:
            attribute = .centerX
            constant = constantStruct.x

        case .centerY, .centerYGuide:
            attribute = .centerY
            constant = constantStruct.y

        case .width:
            attribute = .width
            constant = constantStruct.width

        case .height:
            attribute = .height
            constant = constantStruct.height

        case .none:
            attribute = .notAnAttribute
            constant = 0.0
        }

        return (attribute, constant)
    }
    
    /**
     Get an UILayoutGuide pinned to the viewController's safe edges.

     - parameters:
     - viewController: UIViewController to get an UILayoutGuide pinned its edges

     - returns:
     Safe UILayoutGuide.
     */

    static func safeLayoutGuide(for viewController: UIViewController) -> UILayoutGuide {

        let layoutGuide = UILayoutGuide()
        viewController.view.addLayoutGuide(layoutGuide)

        NSLayoutConstraint.activate(
            [
                NSLayoutConstraint(
                    item: layoutGuide, attribute: .top, relatedBy: .equal,
                    toItem: viewController.topLayoutGuide, attribute: .bottom,
                    multiplier: 1, constant: 0
                ),
                NSLayoutConstraint(
                    item: layoutGuide, attribute: .bottom, relatedBy: .equal,
                    toItem: viewController.bottomLayoutGuide, attribute: .top,
                    multiplier: 1, constant: 0
                ),
                NSLayoutConstraint(
                    item: layoutGuide, attribute: .leading, relatedBy: .equal,
                    toItem: viewController.view, attribute: .leading,
                    multiplier: 1, constant: 0
                ),
                NSLayoutConstraint(
                    item: layoutGuide, attribute: .trailing, relatedBy: .equal,
                    toItem: viewController.view, attribute: .trailing,
                    multiplier: 1, constant: 0
                )
            ]
        )

        return layoutGuide
    }
}
