////
////  NSLayoutConstraint.Attribute+Finder.swift
////  ConstrictorTests
////
////  Created by Pedro Carrasco on 23/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////
//
//import UIKit
//
//extension NSLayoutConstraint {
//
//    func isFrom(_ attribute: NSLayoutConstraint.Attribute, relatedTo view: UIView?, at index: ConstraintIndex) -> Bool {
//
//        return isItem(at: view, from: index, anAttributeFrom: attribute)
//    }
//}
//
//private extension NSLayoutConstraint {
//
//    func isItem(at view: UIView?, from index: ConstraintIndex, anAttributeFrom attribute: NSLayoutConstraint.Attribute) -> Bool {
//
//        return index.item(from: self) == view && firstAttribute == attribute
//    }
//}
