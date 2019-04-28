//
//  ViewController.swift
//  ScaleIt
//
//  Created by Alberto Medina on 4/25/19.
//  Copyright © 2019 Alberto Medina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    @IBOutlet weak var forceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        forceLabel.text = "385+ grams"
                    } else {
                        let force = touch.force/touch.maximumPossibleForce
                        let grams = force * 385
                        let roundGrams = Int(grams)
                        forceLabel.text = "\(roundGrams) grams"
                    }
                }
            }
        }
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        forceLabel.text = "0 gram"
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SaveButton", sender: nil)
    }
}


