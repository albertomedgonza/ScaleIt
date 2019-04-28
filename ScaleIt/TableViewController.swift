//
//  TableViewController.swift
//  ScaleIt
//
//  Created by Alberto Medina on 4/26/19.
//  Copyright © 2019 Alberto Medina. All rights reserved.
//

//import UIKit
//
//class TableViewController: UITableViewController {
//
//    @IBOutlet weak var editBarButton: UIBarButtonItem!
//    
//    var defaultsData = UserDefaults.standard
//    var weightedItemsArray = [String]()
//    var weightArray = [Double]()
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        weightArray = [defaultsData.double(forKey: "weightArray")]
//        weightedItemsArray = defaultsData.stringArray(forKey: "weightedItemsArray") ?? [String]()
//
//        func saveDefaultsData() {
//            defaultsData.set(weightArray, forKey: "toDoArray")
//            defaultsData.set(weightedItemsArray, forKey: "weightedItemsArray")
//        }
//        
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "EditItem" {
//                let destination = segue.destination as! DetailViewController
//                let index = tableView.indexPathForSelectedRow!.row
//                destination.toDoItem = toDoArray[index]
//                destination.toDoNoteItem = toDoNotesArray[index]
//            } else {
//                if let selectedPath = tableView.indexPathForSelectedRow {
//                    tableView.deselectRow(at: selectedPath, animated: false)
//                }
//            }
//        }
//        
//    }
//
//    @IBAction func editBarButtonPressed(_ sender: Any) {
//    }
//    
//    }







