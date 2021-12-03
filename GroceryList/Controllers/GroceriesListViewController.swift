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
        tableView.dataSource = self
        print(FileManager.getDocumentsDirectory())
        loadEvents()
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
        guard let createItemController = segue.source as? CreateItemViewController, let createdItem = createItemController.items else {
            fatalError("failed to access CreateItemVC")
        }

        // persist (save) elements to documents directory
        do {
            try PersistenceHelper.saveItem(item: createdItem)
        } catch {
            print("Error: saving event with error -> \(error)")
        }

        // insert new item into our items array
        // 1. Update the data model
        items.insert(createdItem, at: 0)

        // create an indexpath to be inserted into the tableView
        let indexPath = IndexPath(row: 0, section: 0) // this represents to the top of the tableView

        // 2.update the table view
        // use index path to insert into the table view
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        isEditingTableView.toggle()
    }
}
    
   


extension GroceriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groceryItemCell", for: indexPath) as? configureGroceryCell else {
            fatalError("Could not access itemCell VC")
        }
        let groceryItem = items[indexPath.row]
        cell.configureCell(for: groceryItem)
        return cell
    }
}
