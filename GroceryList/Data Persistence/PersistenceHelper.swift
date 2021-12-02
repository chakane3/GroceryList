//
//  PersistenceHelper.swift
//  GroceryList
//
//  Created by Chakane Shegog on 11/28/21.
//

import Foundation

enum DataPersistenceError: Error {
    case savingError(Error)
    case fileDoesNotExist(String)
    case noData
    case decodingError(Error)
    case deletingError(Error)
}

class PersistenceHelper {
    
    private static var groceryItems = [GroceryItem]()
    private static let filename = "groceries.plist"
    
    // appends new data to our array
    static func saveItem(item: GroceryItem) throws {
        groceryItems.append(item)
        // try save()
    }
    
    // persist data with filemanager
    static func save() throws {
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        do {
            let data = try PropertyListEncoder().encode(groceryItems)
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    
    // load (read) - retrieve items from documents directory
    static func loadEvents() throws -> [GroceryItem] {
        
        // access the filename URL that we are reading from
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        // check if file exists
        if FileManager.default.fileExists(atPath: url.path) {
            
            // read from the file
            if let data = FileManager.default.contents(atPath: url.path) {
                do {
                    groceryItems = try PropertyListDecoder().decode([GroceryItem].self, from: data)
                } catch {
                    throw DataPersistenceError.decodingError(error)
                }
            } else {
                throw DataPersistenceError.noData
            }
        } else {
            throw DataPersistenceError.fileDoesNotExist(filename)
        }
        return groceryItems
    }
    
    // delete - remove item from documents directory
    static func delete(groceryItem index: Int) throws {
        
        // remove the item
        groceryItems.remove(at: index)
        
        // save the updated events array to the documents directory
        do {
            try save()
        } catch {
            throw DataPersistenceError.deletingError(error)
        }
    }
    
}
