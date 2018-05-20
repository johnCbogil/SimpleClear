//
//  ItemTableViewCell.swift
//  SimpleClear
//
//  Created by John Bogil on 5/17/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

protocol AddToListDelegate {
    func addItemToList(item:ToDoItem)
}

class ItemTableViewCell: UITableViewCell, UITextFieldDelegate {
    
//    @IBOutlet weak var label: UILabel!
    
    var addToListDelegate: AddToListDelegate!
    var toDoItem: ToDoItem? {
        didSet {
//            label.text = toDoItem!.text
        }
    }

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        addToListDelegate.addItemToList(item: toDoItem!)
        // NEED TO FIDN THE MATCHING TODOITEM IN THE LIST AND WRITE THE TEXT TO IT
        toDoItem!.text = textField.text!

        
        
        return true
    }
}
