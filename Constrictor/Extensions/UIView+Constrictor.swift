//
//  UIView+Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {

    @discardableResult func constrict(_ type: ConstrictPosition,
                                      to view: UIView? = nil,
                                      spacing: CGFloat) -> UIView {
        
        guard let superview = superview else { return self }

        type.constrict(viewA: self, to: view ?? superview, spacing: spacing)

        return self
    }

    @discardableResult func constrict(_ type: ConstrictSize,
                                      to view: UIView? = nil,
                                      size: CGFloat? = nil) -> UIView {

        switch type {
        case .width:
            break
        case .height:
            break
        }

        return self
    }
}


