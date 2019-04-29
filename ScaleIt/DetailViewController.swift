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
    var defaultsData = UserDefaults.standard
    var weightedItemsArray = [String]()
    var weightArray = [String]()
    
    
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
        enableDisableButton()
        weightedItemField.becomeFirstResponder()
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        weightedItemsArray = defaultsData.stringArray(forKey: "weightedItemsArray") ?? [String]()
        weightArray = defaultsData.stringArray(forKey: "weightArray") ?? [String]()
        weightedItemsArray.append(weightedItemField.text!)
        weightArray.append(weightLabel.text!)
        defaultsData.set(weightArray, forKey: "weightArray")
        defaultsData.set(weightedItemsArray, forKey: "weightedItemsArray")
        
}

    func enableDisableButton() {
        if let weightedItemFieldCount = weightedItemField.text?.count, weightedItemFieldCount > 0 {
            print("Field count is more than 0")
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
            print("Field count is 0")
        }
    }
    
    @IBAction func weightedItemFieldChanged(_ sender: Any) {
        enableDisableButton()
    }
    
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        let isPresentingInSaveMode = presentingViewController is UINavigationController
        if isPresentingInSaveMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    

    


}
