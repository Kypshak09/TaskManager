import UIKit
import SnapKit

class AddMeetingCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.isHidden = true
        return switcher
    }()
    
    var switchRepeat: SwitchRepeatProtocol?
    
    let cellNames = [["Type of Meeting","City","Address"],["Name"], ["Date", "Time"],[""],["Period"]]

    
    func getCellNames(indexPath: IndexPath, hexColor: String) {
        label.text = cellNames[indexPath.section][indexPath.row]
        
        if indexPath == [3,0] {
            switcher.isHidden = true
        }
        
        if indexPath == [4,0] {
            switcher.isHidden = false
            switcher.onTintColor = UIColor().color(hexColor)
        }
        
        
    }
    
    @objc func switcherChange(paramTarget: UISwitch) {
        switchRepeat?.switchRepeat(value: paramTarget.isOn)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        switcher.addTarget(self, action: #selector(switcherChange(paramTarget: )), for: .allEvents)
        
        constraintsCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraintsCell() {
        self.addSubview(cellView)
        cellView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(43)
            make.width.equalToSuperview()
            
            cellView.addSubview(label)
            label.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(10)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-10)
            }
            
            self.contentView.addSubview(switcher)
            switcher.snp.makeConstraints { make in
                make.width.equalTo(30)
                make.top.equalToSuperview().offset(5)
                make.trailing.equalToSuperview().offset(-35)
            }
        }
    }
}
