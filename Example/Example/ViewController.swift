//
//  ViewController.swift
//  Example
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit
import Constrictor


class ViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()
    let greenView = UIView() 

    override func viewDidLoad() {
        super.viewDidLoad()

        // ** Red View **
        // Boilerplate
        redView.backgroundColor = .red
        view.addSubview(redView)

        // Constraints -> Same dimensions of redview's superview
        redView.constrictEdges(to: self, withinGuides: false)

        // ** Blue View **
        // Boilerplate
        blueView.backgroundColor = .blue
        redView.addSubview(blueView)

        // Constraints -> 75 width, 75 height and centered in viewcontroller's view
        blueView.constrictSize(to: 75.0)
            .constrictCenter(in: self)

        // ** Green View **
        // Boilerplate
        greenView.backgroundColor = .green
        redView.addSubview(greenView)

        // Constraints -> Same width, height and centerY of blueView, greenView at the left of blueView with a spacing of 8
        greenView.constrict(to: blueView, attributes: .width, .centerYGuide)
            .constrictToParent(attributes: .height)
            .constrict(.trailing, to: blueView, attribute: .leading, with: 8)
    }
}
