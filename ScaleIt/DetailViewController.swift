//
//  DetailViewController.swift
//  ScaleIt
//
//  Created by Alberto Medina on 4/27/19.
//  Copyright © 2019 Alberto Medina. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var weightedItemField: UITextField!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    var weightedItem: String?
    var weightAmount: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightLabel.text = weightAmount
    
        if let weightedItem = weightedItem {
            weightedItemField.text = weightedItem
            self.navigationItem.title = "Edit Weighted Item"
        } else {
            self.navigationItem.title = "New Weighted Item"
        }
        if let weightAmount = weightAmount {
            weightLabel.text = weightAmount
        
            
        }
        enableDisableSaveButton()
        weightedItemField.becomeFirstResponder()
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "UnwindFromSave" {
        weightedItem = weightedItemField.text
        weightAmount = weightLabel.text
    }
}

func enableDisableSaveButton() {
    if let weightedItemFieldCount = weightedItemField.text?.count, weightedItemFieldCount > 0 {
        saveBarButton.isEnabled = true
    } else {
        saveBarButton.isEnabled = false
    }
}
    @IBAction func weightedItemFieldChanged(_ sender: Any) {
        enableDisableSaveButton()
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        let isPresentingInEditMode = presentingViewController is UINavigationController
        if isPresentingInEditMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    }
    

