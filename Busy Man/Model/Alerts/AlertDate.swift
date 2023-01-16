import UIKit

extension UIViewController {
    
    func alertDate(label: UILabel, completionHandler: @escaping (Int, Date)-> Void) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        alert.view.addSubview(datePicker)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormat.string(from: datePicker.date)
            
            let calendar = Calendar.current
            let component = calendar.dateComponents([.weekday], from: datePicker.date)
            guard let weekday = component.weekday else {return}
            let numberOfWeek = weekday
            let date = datePicker.date
            completionHandler(numberOfWeek, date)
            
            label.text = dateString
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
    
}
