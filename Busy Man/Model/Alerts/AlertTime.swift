import UIKit

extension UIViewController {
    
    func alertTime(label: UILabel, completionHandler: @escaping (Date)-> Void) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        let timePicker = UIDatePicker()
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.datePickerMode = .time
        timePicker.locale = NSLocale(localeIdentifier: "KZ_kz") as Locale
        
        alert.view.addSubview(timePicker)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            let timeString = timeFormatter.string(from: timePicker.date)
            let timeSchedule = timePicker.date
            completionHandler(timeSchedule)
            label.text = timeString
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        timePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        timePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
    
}
