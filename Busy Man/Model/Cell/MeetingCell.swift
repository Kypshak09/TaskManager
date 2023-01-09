//
//  MeetingCell.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 09.01.2023.
//
//
import UIKit
import SnapKit

class MeetingCell: UITableViewCell {
  
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "some"
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
}
