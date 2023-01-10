//
//  UILabel.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 10.01.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, aligment: NSTextAlignment) {
        self.init()
        self.text = text
        self.font = font
        self.textAlignment = aligment
        self.textColor = .black
        self.adjustsFontSizeToFitWidth = true
    }
}
