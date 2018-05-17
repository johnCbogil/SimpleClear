//
//  ViewController.swift
//  SimpleClear
//
//  Created by John Bogil on 5/17/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var listOfItems: [String] = ["a","b","c"]
    let itemTableViewCell = "ItemTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: itemTableViewCell, bundle: nil), forCellReuseIdentifier: itemTableViewCell)
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemToList))
        self.navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc func addItemToList() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: itemTableViewCell, for: indexPath) as! ItemTableViewCell
        return cell
    }
}

