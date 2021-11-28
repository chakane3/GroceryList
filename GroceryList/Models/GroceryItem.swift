//
//  GroceryItem.swift
//  GroceryList
//
//  Created by Chakane Shegog on 11/28/21.
//

import Foundation


struct GroceryItem: Codable {
    let item: String
    let quantity: Int
    let department: String  // i.e meat, dairy, produce, bakery, deli, packaged
}
