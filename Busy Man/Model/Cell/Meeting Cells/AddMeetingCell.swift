import UIKit
import SnapKit

class AddMeetingCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        if indexPath == [0,0] {
            switcher.isHidden = true
        }
        
        if indexPath == [0,1] {
            switcher.isHidden = true
        }
        
        if indexPath == [0,2] {
            switcher.isHidden = true
        }
        
        if indexPath == [1,0] {
            switcher.isHidden = true
        }
        
        if indexPath == [2,0] {
            switcher.isHidden = true
        }
        
        if indexPath == [2,1] {
            switcher.isHidden = true
        }
        
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
        self.selectionStyle = .none
        self.backgroundColor = .clear
        switcher.addTarget(self, action: #selector(switcherChange(paramTarget: )), for: .valueChanged)
         
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
        }
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalTo(cellView).offset(10)
            make.centerX.equalTo(cellView)
            make.bottom.equalTo(cellView).offset(-10)
        }
        self.contentView.addSubview(switcher)
        switcher.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-35)
        }
    }
}

