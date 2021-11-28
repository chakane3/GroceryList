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


