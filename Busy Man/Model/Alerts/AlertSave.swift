//
//  AlertSave.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 16.01.2023.
//

import UIKit

extension UIViewController {
    
    func alertSave(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
}
