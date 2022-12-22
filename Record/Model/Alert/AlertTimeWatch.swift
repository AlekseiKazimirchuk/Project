//
//  AlertTimeWatch.swift
//  Record
//
//  Created by Алешка on 27.09.22.
//

import UIKit

extension UIViewController {
    
func alertTimeWatch(label: UILabel, completionHandler: @escaping (Date) -> Void) {
    let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
    
    
    let datePicker = UIDatePicker()
    datePicker.datePickerMode = .time
    datePicker.preferredDatePickerStyle = .wheels
    datePicker.locale = NSLocale(localeIdentifier: "Ru_ru") as Locale
    
   
    
    alert.view.addSubview(datePicker)
    
    
    let ok = UIAlertAction(title: "OK", style: .default) { (action) in
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: datePicker.date)
        let timeSchedule = datePicker.date 
        completionHandler(timeSchedule)
        label.text = timeString
        
}
    let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    
    alert.addAction(ok)
    alert.addAction(cancel)
    
    alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true

   datePicker.translatesAutoresizingMaskIntoConstraints = false
    
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
    datePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
    datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
    /*datePicker.widthAnchor.constraint(equalToConstant: 140).isActive = true
    datePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
    datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
    datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 50).isActive = true
    
    datePickerTwo.translatesAutoresizingMaskIntoConstraints = false
    datePickerTwo.widthAnchor.constraint(equalToConstant: 140).isActive = true
    datePickerTwo.heightAnchor.constraint(equalToConstant: 160).isActive = true
    datePickerTwo.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -50).isActive = true
    datePickerTwo.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true*/
    
    
 
    
    
    
    present(alert,animated: true, completion: nil)
}
}
