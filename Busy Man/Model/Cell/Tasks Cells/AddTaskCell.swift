import UIKit
import SnapKit

class AddTaskCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    

    
    let cellNames = [["Title","Description of task"], ["Date","Time"]]

    
    func getCellNames(indexPath: IndexPath) {
        label.text = cellNames[indexPath.section][indexPath.row]
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        
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
        }
    }
}
import Foundation
