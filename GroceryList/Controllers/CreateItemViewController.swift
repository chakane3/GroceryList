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
    var items: GroceryItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameTextField.delegate = self
        quantityTextField.delegate = self
        departmentTextField.delegate = self
        
    }
}
    


extension CreateItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss keyboard
        textField.resignFirstResponder()
        
        // update name
        items?.item = itemNameTextField.text ?? "no grocery item name"
        
        // update quantity
        items?.quantity = quantityTextField.text ?? "no item quantity"
        
        // update department
        items?.department = departmentTextField.text ?? "No department name"
        
        return true
    }
}
