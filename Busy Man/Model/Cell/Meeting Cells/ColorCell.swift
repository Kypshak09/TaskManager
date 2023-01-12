import UIKit
import SnapKit

class ColorCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    func getCellNames(indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: cellView.backgroundColor = .white
        case 1: cellView.backgroundColor = .red
        case 2: cellView.backgroundColor = .blue
        case 3: cellView.backgroundColor = .yellow
        case 4: cellView.backgroundColor = .green
        default: cellView.backgroundColor = .gray
        }
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
        }
    }
}
