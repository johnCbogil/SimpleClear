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

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let item = textField.text {
            addToListDelegate.addItemToList(item: item)
        }
        return true
    }

}
