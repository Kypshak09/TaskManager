import UIKit
import SnapKit

class AddMeetingController: UITableViewController {
    
    let identifier = "identifierAddMeController"
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add new meeting"
        tableView.backgroundColor = .systemGray2
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(AddMeetingCell.self, forCellReuseIdentifier: identifier)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 1
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AddMeetingCell
        cell.backgroundColor = .systemGray2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
