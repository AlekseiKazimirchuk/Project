//
//  RecordViewController.swift
//  Record
//
//  Created by Алешка on 1.08.22.
//

import UIKit
import FSCalendar
import FirebaseDatabase
import RealmSwift

class RecordViewController: UIViewController {
    
   var calendarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewRecord: UITableView!
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    let showHideButton: UIButton = {
        let button = UIButton ()
        button.setTitle("Открыть календарь", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let localRealm = try! Realm()
    var clientsNewModelArray: Results<NewClientsModel>!
    
    let idRecordCell = "idRecordCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableViewRecord.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //clientsNewModelArray = localRealm.objects(NewClientsModel.self)
       
        
        calendar.dataSource = self
        calendar.delegate = self
        
        calendar.scope = .week
        calendar.locale = Locale(identifier: "Rus")
        
        calendar.firstWeekday = 2
        calendar.appearance.titleDefaultColor = #colorLiteral(red: 0.09019607843, green: 0.1098039216, blue: 0.1529411765, alpha: 1)
       
        calendar.daysContainer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        calendar.appearance.headerTitleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        calendar.appearance.weekdayTextColor = #colorLiteral(red: 0.09019607843, green: 0.1098039216, blue: 0.1529411765, alpha: 1)
        calendar.appearance.todayColor = #colorLiteral(red: 0.5019338131, green: 0.5388896465, blue: 0.6109331846, alpha: 1)
        calendar.appearance.selectionColor = #colorLiteral(red: 0.09019607843, green: 0.1098039216, blue: 0.1529411765, alpha: 1)
        calendar.calendarHeaderView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        calendar.calendarWeekdayView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        tableViewRecord.delegate = self
        tableViewRecord.dataSource = self
        tableViewRecord.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints ()
        swipeAction()
        scheduleOnDay(date: Date())
        
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
    }
    
    @IBAction func addClient(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "NewClientsRecordTableViewController") as! NewClientsRecordTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showHideButtonTapped(){
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Закрыть календарь", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Открыть клаендарь", for: .normal)
        }
    }
    
    //MARK: SwipeGestureRecognizer
    
    func swipeAction() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        calendar.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .up:
            showHideButtonTapped()
        case .down:
            showHideButtonTapped()
        default:
            break
        }
    }
    private func scheduleOnDay(date: Date) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: date)
        guard let weekday = components.weekday else {return}
            //print (weekday)
        
        let dateStart = date
        let dateEnd: Date = {
            let components = DateComponents(day: 1, second: -1)
            return Calendar.current.date(byAdding: components, to: dateStart)!
        }()
        
        let predicateRepeat = NSPredicate(format: "weekDay = \(weekday) AND repeatDay = true ")
        let predicateUnrepeat = NSPredicate(format: "repeatDay = false AND dateService BETWEEN %@", [dateStart, dateEnd])
        let compound = NSCompoundPredicate(type: .or, subpredicates: [predicateRepeat, predicateUnrepeat])
        
        clientsNewModelArray = localRealm.objects(NewClientsModel.self).filter(compound).sorted(byKeyPath: "timeService")
        tableViewRecord.reloadData()
    }
    }

// MARK: UITableViewDataSource, UITableViewDelegate
extension RecordViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientsNewModelArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewRecord.dequeueReusableCell(withIdentifier: idRecordCell, for: indexPath) as! RecordTableViewCell
        
        let model = clientsNewModelArray[indexPath.row]
        
        cell.configure(model: model)
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecordNewClientsTableViewController") as! RecordNewClientsTableViewController
            
         self.navigationController?.pushViewController(vc, animated: true)
      }*/
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editingRow = clientsNewModelArray[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completionHandler in
            RealmManager.shared.deleteNewClientsModel(model: editingRow)
            self.tableViewRecord.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

 //MARK: FSCalendarDataSource, FSCalendarDelegate

extension RecordViewController: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        scheduleOnDay(date: date)
        
    }
}
//MARK: SetConstraints

extension RecordViewController {
    func setConstraints () {
        view.addSubview(calendar)
        
        calendarHeightConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeightConstraint)
        
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            ])
        view.addSubview(showHideButton)
        
        NSLayoutConstraint.activate([
            showHideButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
            showHideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            showHideButton.widthAnchor.constraint(equalToConstant: 150),
            showHideButton.heightAnchor.constraint(equalToConstant: 20)
            
            ])
        
        NSLayoutConstraint.activate([
            tableViewRecord.topAnchor.constraint(equalTo: showHideButton.bottomAnchor, constant: 10),
            tableViewRecord.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableViewRecord.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableViewRecord.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        
    }
}
