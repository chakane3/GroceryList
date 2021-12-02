//
//  CreateItemViewController.swift
//  GroceryList
//
//  Created by Chakane Shegog on 12/2/21.
//

import UIKit

class CreateItemViewController: UIViewController {
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    
    // bring in grocery item var
    var item: GroceryItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension CreateItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss keyboard
        textField.resignFirstResponder()
        
        // update name
        item?.item = itemNameTextField.text ?? "no grocery item name"
        
        // update quantity
        item?.quantity = quantityTextField.text ?? "no item quantity"
        
        // update department
        item?.department = departmentTextField.text ?? "No department name"
        
        return true
    }
}
