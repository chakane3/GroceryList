//
//  configureGroceryCell.swift
//  GroceryList
//
//  Created by Chakane Shegog on 12/2/21.
//

import UIKit

class configureGroceryCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
//    var groceryItem: GroceryItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(for item: GroceryItem) {
        nameLabel.text = item.item
        quantityLabel.text = item.quantity
        departmentLabel.text = item.department
    }
}
