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
        redView.constrictEdgesToContainer()

        // Or like it's done bellow
        /* redView.constrictToContainer(attributes: .top, .bottom, .leading, .trailing) */

        // Or if you want an offset of 50 over all edges
        /*redView.constrictToContainer(attributes: .top, .bottom, .leading, .trailing, constant: 50.0) */

        // ** Blue View **
        // Boilerplate
        blueView.backgroundColor = .blue
        redView.addSubview(blueView)

        // Constraints -> 75 width, 100 height and centered in redview (superview)
        blueView.constrict(.width, constant: 75)
            .constrict(.height, constant: 100)
            .constrictCenterInContainer()

        // ** Green View **
        // Boilerplate
        greenView.backgroundColor = .green
        redView.addSubview(greenView)

        // Constraints -> Same width, height and centerY of blueView, greenView at the left of blueView with a spacing of 50
        greenView.constrict(attributes: .width, .height, .centerY, to: blueView)
            .constrict(.trailing, to: blueView, attribute: .leading, constant: 50)
    }
}
