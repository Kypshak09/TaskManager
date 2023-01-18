import UIKit
import SnapKit
import RealmSwift

class AddMeetingController: UITableViewController {
    
   private let identifier = "identifierAddMeController"
   private let header = "header"
    
    let headerArray = ["Place and type of meeting","Person", "Date and time", "Color", "Period"]
    
    var hexColorCell = String()
 
    private var meetingData = MeetingData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New meeting"
        tableView.backgroundColor = .systemGray2
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        self.tableView.register(AddMeetingCell.self, forCellReuseIdentifier: identifier)
        self.tableView.register(HeaderMeeting.self, forHeaderFooterViewReuseIdentifier: header)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveMeetings))
        
    }
    @objc func saveMeetings() {
        
        RealmManager.shared.saveMeetingData(data: meetingData)
        meetingData = MeetingData()
        alertSave(title: "Successfully added")
        tableView.reloadRows(at: [[0,0],[0,1],[0,2],[1,0],[2,0],[2,1]], with: .automatic)
        meetingData.color = hexColorCell
        print(meetingData.color)
        
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 1
        case 2: return 2
        case 3: return 1
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AddMeetingCell
        let color = UIColor().color(hexColorCell)
        cell.backgroundColor = (indexPath.section == 3 ? color: .white)
        cell.getCellNames(indexPath: indexPath, hexColor: hexColorCell)
        cell.switchRepeat = self
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
        
        let cell = tableView.cellForRow(at: indexPath) as! AddMeetingCell
        
        switch indexPath {
        case [2,0]: alertDate(label: cell.label) { numberWeek, date in
            self.meetingData.date = date
            self.meetingData.weekRepeat = numberWeek
        }
        case [2,1]: alertTime(label: cell.label) { time in
            self.meetingData.time = time
        }
        case [0,0]: alertLabel(label: cell.label, name: "Type of meeting", placeholder: "Enter type of meeting") { text in
            self.meetingData.typeOfMeeting = text
            print(text)
        }
        case [0,1]: alertLabel(label: cell.label, name: "Type city", placeholder: "Enter city"){ text in
            self.meetingData.city = text
        }
        case [0,2]: alertLabel(label: cell.label, name: "Type address of meeting", placeholder: "Enter address of meeting") { text in
            self.meetingData.address = text
        }
        case [1,0]: alertLabel(label: cell.label, name: "Type name of person", placeholder: "Enter name here"){ text in
            self.meetingData.name = text
        }
        case[3,0]: navigationController?.pushViewController(ChooseColorMeeting(), animated: true)
        default: print("Error")
        }
        
    }
}

extension AddMeetingController: SwitchRepeatProtocol {
    func switchRepeat(value: Bool) {
        meetingData.repeatPeriod = value
    }
    
    
}
