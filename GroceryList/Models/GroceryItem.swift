//
//  GroceryItem.swift
//  GroceryList
//
//  Created by Chakane Shegog on 11/28/21.
//

import Foundation


struct GroceryItem: Codable {
    var item: String
    var quantity: String
    var department: String  // i.e meat, dairy, produce, bakery, deli, packaged
}
