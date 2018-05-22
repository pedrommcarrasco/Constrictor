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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ** Red View **
        // Boilerplate
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        // Constraints
        redView.constrictFillContainer()
        
        // ** Blue View **
        // Boilerplate
        blueView.backgroundColor = .blue
        redView.addSubview(blueView)
        
        // Constraints
        blueView.constrict(.width, constant: 50.0)
            .constrict(.height, constant: 50.0)
            .constrictCenterInContainer()
    }
}
