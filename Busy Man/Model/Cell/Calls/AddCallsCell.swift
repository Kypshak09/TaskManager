//
//  AddCallsCell.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 13.01.2023.
//

import UIKit
import SnapKit

class AddCallsCell: UITableViewCell {
    
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
    
    let addImageContact: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "person.badge.plus")
        image.backgroundColor = .white
        image.tintColor = .black
        image.contentMode = .scaleToFill
        image.isHidden = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let label1 = UILabel(text: "Choose picture", font: UIFont(name: "Arial", size: 25), aligment: .center)
    

    
    let cellNames = [["Name"], ["Phone"], ["Mail"],["Type"],[""]]
    
    func getCellNames(indexPath: IndexPath) {
        label.text = cellNames[indexPath.section][indexPath.row]
        label1.isHidden = true
        
        if indexPath == [4,0] {
            addImageContact.isHidden = false
            label1.isHidden = false
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
        cellView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        
        self.addSubview(addImageContact)
        addImageContact.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        self.addSubview(label1)
        label1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(addImageContact).offset(40)
            make.width.equalTo(150)
        }
    }
}
