//
//  FileManager+Extensions.swift
//  GroceryList
//
//  Created by Chakane Shegog on 11/28/21.
//

import Foundation

extension FileManager {
    
    static func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func pathToDocumentsDirectory(with fileName: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(fileName)
    }
}
