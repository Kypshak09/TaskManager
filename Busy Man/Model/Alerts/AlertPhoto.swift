//
//  AlertPhoto.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 13.01.2023.
//

import UIKit
import SnapKit

extension UIViewController {
    func alertPhoto(completionHandler: @escaping(UIImagePickerController.SourceType) -> Void) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandler(camera)
        }
        
        let gallery = UIAlertAction(title: "Gallery", style: .default) { _ in
            let gallery = UIImagePickerController.SourceType.photoLibrary
            completionHandler(gallery)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(gallery)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
    }
}
