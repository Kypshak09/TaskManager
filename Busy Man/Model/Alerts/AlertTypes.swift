//
//  AlertTypes.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 13.01.2023.
//

import UIKit
import SnapKit

extension UIViewController {
    func alertType(label: UILabel, completionHandler: @escaping(String) -> Void) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let collegues = UIAlertAction(title: "Collegues", style: .default) { _ in
            label.text = "Collegue"
            let type = "Collegue"
            completionHandler(type)
        }
        
        let partner = UIAlertAction(title: "Partner", style: .default) { _ in
            label.text = "Partner"
            let type = "Partner"
            completionHandler(type)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(collegues)
        alert.addAction(partner)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
    }
}
