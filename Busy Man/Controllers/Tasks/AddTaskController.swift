import UIKit
import SnapKit

class AddTaskController: UITableViewController {
    
    let identifier = "identifierAddTaskController"
    let header = "headerTask"
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add new meeting"
        tableView.backgroundColor = .systemGray2
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        self.tableView.register(AddTaskCell.self, forCellReuseIdentifier: identifier)
        self.tableView.register(HeaderTask.self, forHeaderFooterViewReuseIdentifier: header)
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        default: return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AddTaskCell
        cell.getCellNames(indexPath: indexPath)
        cell.backgroundColor = .systemGray2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: header) as! HeaderTask
        header.label.text = header.headerArray[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! AddTaskCell
        
        switch indexPath {
        case [1,0]: alertDate(label: cell.label) { numberWeek, date in
            print(numberWeek, date)
        }
        case [1,1]: alertTime(label: cell.label) { time in
            print(time)
        }
        case[0,0]: alertLabel(label: cell.label, name: "Title of Task", placeholder: "Type here")
        case[0,1]: alertLabel(label: cell.label, name: "Description of Task", placeholder: "Type here")
        default: print("Error")
        }
        
    }
}
