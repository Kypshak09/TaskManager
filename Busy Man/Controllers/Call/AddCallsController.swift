//
//  AddCallsController.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 13.01.2023.
//

import UIKit
import SnapKit

class AddCallsController: UITableViewController {
    
    let identifier = "identifierAddCallController"
    let header = "headerCall"
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add new meeting"
        tableView.backgroundColor = .systemGray2
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        self.tableView.register(AddCallsCell.self, forCellReuseIdentifier: identifier)
        self.tableView.register(HeaderCall.self, forHeaderFooterViewReuseIdentifier: header)
        
        
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
        case 4: return 1
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AddCallsCell
        cell.getCellNames(indexPath: indexPath)
        cell.backgroundColor = .systemGray2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: header) as! HeaderCall
        header.label.text = header.headerArray[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! AddCallsCell
        
        switch indexPath {
        case[0,0]: alertLabel(label: cell.label, name: "Name", placeholder: "Type here")
        case[1,0]: alertLabel(label: cell.label, name: "Phone", placeholder: "Type here")
        case[2,0]: alertLabel(label: cell.label, name: "Mail", placeholder: "Type here")
        case[3,0]: alertType(label: cell.label) { type in
            print(type)
        }
        default: print("Error")
        }
        
    }
}
