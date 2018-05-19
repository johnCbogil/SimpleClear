//
//  ItemTableViewCell.swift
//  SimpleClear
//
//  Created by John Bogil on 5/17/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

protocol AddToListDelegate {
    func addItemToList(item:String)
}

class ItemTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var addToListDelegate: AddToListDelegate!
    var toDoItem: ToDoItem? {
        didSet {
            textField.text = toDoItem!.text
        }
    }

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let item = textField.text {
            addToListDelegate.addItemToList(item: item)
        }
        return true
    }
}
