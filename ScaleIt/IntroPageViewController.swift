//
//  IntroPageViewController.swift
//  ScaleIt
//
//  Created by Alberto Medina on 4/25/19.
//  Copyright © 2019 Alberto Medina. All rights reserved.
//

import UIKit

class IntroPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func ScaleButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "ScaleButton", sender: nil)
    }
    
    @IBAction func ListButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "ListButton", sender: nil)
    }
    
}
