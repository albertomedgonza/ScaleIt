//
//  TableViewController.swift
//  ScaleIt
//
//  Created by Alberto Medina on 4/26/19.
//  Copyright © 2019 Alberto Medina. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var editBarItem: UIBarButtonItem!
    @IBOutlet weak var backBarItem: UIBarButtonItem!
    
    var defaultsData = UserDefaults.standard
    var weightedItemsArray = [String]()
    var weightArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        weightedItemsArray = defaultsData.stringArray(forKey: "weightedItemsArray") ?? [String]()
        weightArray = defaultsData.stringArray(forKey: "weightsArray") ?? [String]()

        func saveDefaultsData() {
            defaultsData.set(weightArray, forKey: "weightArray")
            defaultsData.set(weightedItemsArray, forKey: "weightedItemsArray")
        }
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "EditItem" {
                let destination = segue.destination as! DetailViewController
                let index = tableView.indexPathForSelectedRow!.row
                destination.weightedItem = weightedItemsArray[index]
                destination.weightAmount = weightArray[index]
            } else {
                if let selectedPath = tableView.indexPathForSelectedRow {
                    tableView.deselectRow(at: selectedPath, animated: false)
                }
            }
        }
        func unwindFromDetailViewController(segue: UIStoryboardSegue) {
            let sourceViewController = segue.source as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                weightedItemsArray[indexPath.row] = sourceViewController.weightedItem!
                weightArray[indexPath.row] = sourceViewController.weightAmount!
                tableView.reloadRows(at: [indexPath], with: .automatic)
            } else {
                let newIndexPath = IndexPath(row: weightedItemsArray.count, section: 0)
                weightedItemsArray.append(sourceViewController.weightedItem!)
                weightArray.append(sourceViewController.weightAmount!)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveDefaultsData()
    }
    }
        @IBAction func backBarButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backItem", sender: nil)
    }
        @IBAction func editBarButtonPressed(_ sender: Any) {
            if tableView.isEditing {
                tableView.setEditing(false, animated: true)
                backBarItem.isEnabled = true
                editBarItem.title = "Edit"
            } else {
                tableView.setEditing(true, animated: true)
                backBarItem.isEnabled = false
                editBarItem.title = "Done"
    }
    
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return weightedItemsArray.count
        }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = weightedItemsArray[indexPath.row]
            cell.detailTextLabel?.text = weightArray[indexPath.row]
            return cell
        }
        
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                weightedItemsArray.remove(at: indexPath.row)
                weightArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                saveDefaultsData()
            }
        }
        
        func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let weightedItemToMove = weightedItemsArray[sourceIndexPath.row]
            let weightToMove = weightArray[sourceIndexPath.row]
            weightedItemsArray.remove(at: sourceIndexPath.row)
            weightArray.remove(at: sourceIndexPath.row)
            weightedItemsArray.insert(itemToMove, at: destinationIndexPath.row)
            weightArray.insert(noteToMove, at: destinationIndexPath.row)
            saveDefaultsData()
        }
    }







