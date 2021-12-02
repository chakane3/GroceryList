//
//  GroceriesListViewController.swift
//  GroceryList
//
//  Created by Chakane Shegog on 12/2/21.
//

import UIKit

class GroceriesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // bring in groceries array
    var items = [GroceryItem]()
    
    // add edit button in navigation bar
    var isEditingTableView = false {
        didSet {
            tableView.isEditing = isEditingTableView
            navigationItem.leftBarButtonItem?.title = isEditingTableView ? "Done" : "Edit"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // function to load grocery items via PersistenceHelper
    private func loadEvents() {
        do {
            items = try PersistenceHelper.loadEvents()
        } catch {
            print("error loading events: \(error)")
        }
    }
    
    // delete event via PersistenceHelper
    private func deleteEvent(indexPath: IndexPath) {
        do {
            try PersistenceHelper.delete(groceryItem: indexPath.row)
        } catch {
            print("Error in deleting: \(error)")
        }
    }
    
    @IBAction func addNewEvent(segue: UIStoryboardSegue) {
        // get a reference to the CreateEventController instance
       // guard let createItemController = segue.source as? CreateItemViewController, let createdEvent = createItemController
    }
    
}
