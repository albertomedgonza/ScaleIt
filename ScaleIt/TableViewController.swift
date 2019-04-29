//
//  TableViewController.swift
//  ScaleIt
//
//  Created by Alberto Medina on 4/26/19.
//  Copyright © 2019 Alberto Medina. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var editBarItem: UIBarButtonItem!
    @IBOutlet weak var backBarItem: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    
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
        func unwindtoTableView(_ sender: UIStoryboardSegue) { }
        
//        func unwindFromDetailViewController(segue: UIStoryboardSegue) {
//            let sourceViewController = segue.source as! DetailViewController
//            if let indexPath = tableView.indexPathForSelectedRow {
//                weightedItemsArray[indexPath.row] = sourceViewController.weightedItem!
//                weightArray[indexPath.row] = sourceViewController.weightAmount!
//                tableView.reloadRows(at: [indexPath], with: .automatic)
//            } else {
//                let newIndexPath = IndexPath(row: weightedItemsArray.count, section: 0)
//                weightedItemsArray.append(sourceViewController.weightedItem!)
//                weightArray.append(sourceViewController.weightAmount!)
//                tableView.insertRows(at: [newIndexPath], with: .automatic)
//            }
//            saveDefaultsData()
//    }
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
    func saveDefaultsData() {
        defaultsData.set(weightArray, forKey: "weightArray")
        defaultsData.set(weightedItemsArray, forKey: "weightedItemsArray")
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return weightedItemsArray.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = weightedItemsArray[indexPath.row]
            cell.detailTextLabel?.text = weightArray[indexPath.row]
            return cell
        }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

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
            weightedItemsArray.insert(weightedItemToMove, at: destinationIndexPath.row)
            weightArray.insert(weightToMove, at: destinationIndexPath.row)
            saveDefaultsData()
        }
    }

//        tableView.delegate = self
//        tableView.dataSource = self
//
//
//        //        for index in 0..<partyItems.count{
//        //            partyListItems.append(PartyListItem(partyItem: partyItems[index], personResponsible: ""))
//        //        }
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "EditItem" {
//            let destination = segue.destination as! DetailViewController
//            let selectedIndexPath = tableView.indexPathForSelectedRow!
//            destination.weightedItem = weightedItemsArray[selectedIndexPath.row]
//        } else {
//            if let selectedPath = tableView.indexPathForSelectedRow {
//                tableView.deselectRow(at: selectedPath, animated: true)
//            }
//        }
//    }
//
//    @IBAction func unwindFromItemDetailViewController(segue: UIStoryboardSegue) {
//        let source = segue.source as! DetailViewController
//        if let selectedIndexPath = tableView.indexPathForSelectedRow {
//            weightedItemsArray[selectedIndexPath.row] = source.weightAmount!
//            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
//        } else {
//            let indexPath = IndexPath(row: weightedItemsArray.count, section: 0)
//            weightedItemsArray.append(source.weightedItem!)
//            tableView.insertRows(at: [indexPath], with: .automatic)
//            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
//        }
//    }
//
//}
//
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weightedItemsArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = weightedItemsArray[indexPath.row].weightedItem
//        cell.detailTextLabel?.text = weightedItemsArray[indexPath.row].personResponsible
//        return cell
//    }
//
//
//}






