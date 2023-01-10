//
//  UIStackView.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 10.01.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubViews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution:  UIStackView.Distribution ) {
        self.init(arrangedSubviews: arrangedSubViews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
}
