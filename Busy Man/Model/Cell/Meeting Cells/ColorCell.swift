import UIKit
import SnapKit

class ColorCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    func getCellNames(indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: cellView.backgroundColor = UIColor().color("BE2813")
        case 1: cellView.backgroundColor = UIColor().color("F07F5A")
        case 2: cellView.backgroundColor = UIColor().color("F3AF22")
        case 3: cellView.backgroundColor = UIColor().color("467C24")
        case 4: cellView.backgroundColor = UIColor().color("2D7FC1")
        default: cellView.backgroundColor = UIColor().color("1A4766")
        }
    }
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        constraintsCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraintsCell() {
        self.contentView.addSubview(cellView)
        cellView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(43)
            make.width.equalToSuperview()
        }
    }
}
