//
//  ViewController.swift
//  SimpleClear
//
//  Created by John Bogil on 5/17/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

// https://www.raywenderlich.com/77975/making-a-gesture-driven-to-do-list-app-like-clear-in-swift-part-2

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddToListDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var listOfItems: [ToDoItem] = []
    let itemTableViewCell = "ItemTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        configureTableView()
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: itemTableViewCell, bundle: nil), forCellReuseIdentifier: itemTableViewCell)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = 50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: itemTableViewCell, for: indexPath) as! ItemTableViewCell
        cell.addToListDelegate = self
        cell.toDoItem = listOfItems[indexPath.row]
        return cell
    }
    
    func addItemToList(item: String) {
//        listOfItems.append(item)
        print(listOfItems)
    }
    
// MARK - SCROLL VIEW NOISE
    
    // a cell that is rendered as a placeholder to indicate where a new item is added
    let placeHolderCell = ItemTableViewCell(style: .default, reuseIdentifier: "cell")
    // indicates the state of this behavior
    var pullDownInProgress = false
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // this behavior starts when a user pulls down while at the top of the table
        pullDownInProgress = scrollView.contentOffset.y <= 0.0
        placeHolderCell.backgroundColor = .red
        if pullDownInProgress {
            // add the placeholder
            tableView.insertSubview(placeHolderCell, at: 0)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewContentOffsetY = scrollView.contentOffset.y
        
        if pullDownInProgress && scrollView.contentOffset.y <= 0.0 {
            // maintain the location of the placeholder
            placeHolderCell.frame = CGRect(x: 0, y: -tableView.rowHeight,
                                           width: tableView.frame.size.width, height: tableView.rowHeight)
            placeHolderCell.textLabel?.text = -scrollViewContentOffsetY > tableView.rowHeight ? "Release to add item" : "Pull to add item"
            placeHolderCell.alpha = min(1.0, -scrollViewContentOffsetY / tableView.rowHeight)
        } else {
            pullDownInProgress = false
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // check whether the user pulled down far enough
        if pullDownInProgress && -scrollView.contentOffset.y > tableView.rowHeight {
            toDoItemAdded()
        }
        pullDownInProgress = false
        placeHolderCell.removeFromSuperview()
    }
    
    func toDoItemAdded() {
        let toDoItem = ToDoItem(text: "")
        listOfItems.insert(toDoItem, at: 0)
        tableView.reloadData()
        // enter edit mode
        var editCell: ItemTableViewCell
        let visibleCells = tableView.visibleCells as! [ItemTableViewCell]
        for cell in visibleCells {
            if (cell.toDoItem == toDoItem) {
                editCell = cell
                editCell.textField.becomeFirstResponder()
                break
            }
        }
    }
}
