import UIKit
import SnapKit

class ChooseColorMeeting: UITableViewController {
    
    let identifier = "identifierChooseMeeting"
    let header = "headerChooseMeeting"
    
    let headerArray = ["Red","Orange", "Yellow", "Green", "Blue", "Deep Blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Colors"
        tableView.backgroundColor = .systemGray2
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        self.tableView.register(ColorCell.self, forCellReuseIdentifier: identifier)
        self.tableView.register(HeaderMeeting.self, forHeaderFooterViewReuseIdentifier: header)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ColorCell
        cell.getCellNames(indexPath: indexPath)
        cell.backgroundColor = .systemGray2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: header) as! HeaderMeeting
        header.label.text = headerArray[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ColorCell
        cell.getCellNames(indexPath: indexPath)
        
        switch indexPath.section {
        case 0:
            setColor(color: "BE2813")
        case 1:
            setColor(color: "F07F5A")
        case 2:
            setColor(color: "F3AF22")
        case 3:
            setColor(color: "467C24")
        case 4:
            setColor(color: "2D7FC1")
        case 5:
            setColor(color: "1A4766")
        default :
            print("Error")
        }
    }
    
    func setColor(color: String) {
        let meeting = self.navigationController?.viewControllers[1] as? AddMeetingController
        meeting?.hexColorCell = color 
//        print(color)
        meeting?.tableView.reloadRows(at: [[3,0], [4,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
}
