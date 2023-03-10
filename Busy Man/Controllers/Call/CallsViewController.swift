//
//  CallsViewController.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 09.01.2023.
//

import UIKit
import SnapKit

class CallsViewController: UITableViewController {
    
    let identifier = "identifierContactCell"
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calls"
        tableView.backgroundColor = .systemGray2
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        self.tableView.register(CallsCell.self, forCellReuseIdentifier: identifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddContact))
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        
    }
    
    @objc func goToAddContact() {
        navigationController?.pushViewController(AddCallsController(), animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CallsCell
//        cell.getCellNames(indexPath: indexPath)
        cell.backgroundColor = .systemGray2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
}
