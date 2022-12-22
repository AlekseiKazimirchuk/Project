//
//  AlertDate.swift
//  Record
//
//  Created by Алешка on 24.11.22.
//

import UIKit

extension UIViewController {
    
func alertDate(label: UILabel, completionHandler: @escaping (Int, Date) -> Void) {
    let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
    
    
    let datePicker = UIDatePicker()
    datePicker.datePickerMode = .date
    datePicker.preferredDatePickerStyle = .wheels
    
    alert.view.addSubview(datePicker)
    
    let ok = UIAlertAction(title: "OK", style: .default) { (action) in
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: datePicker.date)
        
        let calendar = Calendar.current
        let component = calendar.dateComponents([.weekday], from: datePicker.date)
        guard let weekday = component.weekday else {return}
        let numberWeekday = weekday
        let date = datePicker.date
        completionHandler(numberWeekday, date)
        
        label.text = dateString
        
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
