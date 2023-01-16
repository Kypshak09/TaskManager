import UIKit

extension UIViewController {
    
    func alertLabel(label: UILabel,name: String, placeholder: String, completionHandler: @escaping (String)-> Void) {
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
  
            let textField = alert.textFields?.first
            guard let text = textField?.text else {return}
            label.text = text
        }
        alert.addTextField { (text) in
            text.placeholder = placeholder
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
}
