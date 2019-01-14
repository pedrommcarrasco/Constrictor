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
        redView.constrictor
            .edge(to: view)
        
        // ** Blue View **
        // Boilerplate
        blueView.backgroundColor = .blue
        redView.addSubview(blueView)
        
        // Constraints -> 75 width, 75 height and centered in viewcontroller's view
        blueView.constrictor
            .size(to: 75)
            .center(in: view)
        
        // ** Green View **
        // Boilerplate
        greenView.backgroundColor = .green
        redView.addSubview(greenView)
        
        // Constraints -> Same width, height and centerY of blueView, greenView at the left of blueView with a spacing of 8
        greenView.constrictor
            .width(to: blueView)
            .height(to: redView)
            .centerY(to: blueView.safeAreaLayoutGuide)
            .trailing(to: blueView, .leading, with: 8)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.greenView.constrictor
                .update(.trailing, to: self.blueView) { $0?.constant = 50 }
                .updateFirst(.width) { $0?.constant = -15 }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
