//
//  WeekendsProgramSettings.swift
//  Record
//
//  Created by Алешка on 21.07.22.
//

import UIKit
import FSCalendar

class WeekendsProgramSettings: UIViewController {

    let WeekendsProgramSettings = "WeekendsProgramSettings"

    var calendarHeightConstraint: NSLayoutConstraint!
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "График работы"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(readyAction))
        
        navigationController?.navigationBar.tintColor = .black
        
        calendar.dataSource = self
        calendar.delegate = self
        
        calendar.locale = Locale(identifier: "Rus")
        calendar.scrollDirection = .vertical
        calendar.pagingEnabled = false
        
        calendar.firstWeekday = 2
        
        calendar.appearance.titleDefaultColor = #colorLiteral(red: 0.09019607843, green: 0.1098039216, blue: 0.1529411765, alpha: 1)
        calendar.daysContainer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        calendar.appearance.headerTitleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        calendar.appearance.weekdayTextColor = #colorLiteral(red: 0.09019607843, green: 0.1098039216, blue: 0.1529411765, alpha: 1)
        calendar.appearance.todayColor = #colorLiteral(red: 0.5019338131, green: 0.5388896465, blue: 0.6109331846, alpha: 1)
        calendar.appearance.selectionColor = #colorLiteral(red: 0.09019607843, green: 0.1098039216, blue: 0.1529411765, alpha: 1)
        calendar.calendarHeaderView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        calendar.calendarWeekdayView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
       calendar.scope = .month
        calendar.allowsMultipleSelection = true
        setConstraints ()
       
    }
  
    }

//MARK: FSCalendarDataSource, FSCalendarDelegate

extension WeekendsProgramSettings: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print (date)
    }
}

//MARK: SetConstraints

extension WeekendsProgramSettings {
    
    func setConstraints () {
        
        view.addSubview(calendar)
        
        calendarHeightConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 700)
        calendar.addConstraint(calendarHeightConstraint)
        
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            ])
    
    }
    
    @objc func readyAction() {
        dismiss(animated: true)
    }
}
