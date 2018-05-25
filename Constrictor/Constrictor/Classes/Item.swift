//
//  Item.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 25/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

struct Item {

    /**
     Decides if the item to apply a constraint should be an safeArea or not.

     - parameters:
     - view: UIView to validate if it's to apply constraints to itself or its safeArea
     - withinSafeArea: Bool to indicate if you want the view's safeArea.

     - returns:
     Any? containing the view sent or its safeArea.
     */
    static func object(for view: UIView?, withinSafeArea: Bool) -> Any? {

        let secondItem: Any?

        if #available(iOS 11.0, *) {
            secondItem = withinSafeArea ? view?.safeAreaLayoutGuide : view
            
        } else {
            secondItem = view
        }

        return secondItem
    }
}
