//
//  ViewController.swift
//  SimpleClear
//
//  Created by John Bogil on 5/17/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddToListDelegate {

    @IBOutlet weak var tableView: UITableView!
    var listOfItems: [String] = ["a","b","c"]
    let itemTableViewCell = "ItemTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: itemTableViewCell, bundle: nil), forCellReuseIdentifier: itemTableViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: itemTableViewCell, for: indexPath) as! ItemTableViewCell
        cell.addToListDelegate = self
        return cell
    }
    
    func addItemToList(item: String) {
        listOfItems.append(item)
        print(listOfItems)
    }
    
}

