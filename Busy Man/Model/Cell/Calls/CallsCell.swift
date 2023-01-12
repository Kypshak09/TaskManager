//
//  CallsCell.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 13.01.2023.
//

import UIKit
import SnapKit

class CallsCell: UITableViewCell {
    
    
    let contactImage: UIImageView = {
      let image = UIImageView()
        image.image = UIImage(named: "photo")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    let phoneImage: UIImageView = {
      let image = UIImageView()
        image.image = UIImage(systemName: "phone.fill")
        image.tintColor = .black
        return image
    }()
    
    let mailImage: UIImageView = {
      let image = UIImageView()
        image.tintColor = .black
        image.image = UIImage(systemName: "envelope.fill")
        return image
    }()
    
    let nameLabel = UILabel(text: "Chef", font: UIFont(name: "Arial", size: 30), aligment: .natural)
    let phoneLabel = UILabel(text: "8-777-777-77-77", font: UIFont(name: "Arial", size: 20), aligment: .natural)
    let mailLabel = UILabel(text: "amirzhunusov@gmail.com", font: UIFont(name: "Arial", size: 30), aligment: .natural)
    
    
    
    override func layoutIfNeeded() {
        super.layoutSubviews()
        
        contactImage.layer.cornerRadius = contactImage.frame.height / 2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.addSubview(contactImage)
        contactImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(70)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contactImage).offset(-10)
            make.leading.equalTo(contactImage).offset(85)
            make.width.equalTo(100)
        }
        
        self.addSubview(phoneImage)
        phoneImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(20)
            make.leading.equalTo(contactImage).offset(100)
            make.width.height.equalTo(20)
        }
        self.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.leading.equalTo(phoneImage).offset(30)
            make.centerY.equalTo(phoneImage)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        self.addSubview(mailImage)
        mailImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(20)
            make.leading.equalTo(phoneLabel).offset(100)
            make.width.height.equalTo(20)
        }
        self.addSubview(mailLabel)
        mailLabel.snp.makeConstraints { make in
            make.leading.equalTo(mailImage).offset(30)
            make.centerY.equalTo(mailImage)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
