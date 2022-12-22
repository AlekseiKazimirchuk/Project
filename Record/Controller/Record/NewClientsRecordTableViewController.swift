//
//  NewClientsRecordTableViewController.swift
//  Record
//
//  Created by Алешка on 15.11.22.
//

import UIKit
import RealmSwift


class NewClientsRecordTableViewController: UITableViewController {
    
    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"
    var clientsName = [["Клиент"],[""]]
    var cellNameArray = ["Выбрать клиента","Выбрать услугу","Стоймость","Дата","Начало","Окончание"]
    
     var newClientsModel = NewClientsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Новая запись"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorStyle = .none //DELETE
        tableView.bounces = false
        
        tableView.register(NewClientsRecordTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        tableView.register(NewClientsRecordHeaderCell.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Готово",style: .plain, target: self, action: #selector(saveButtonNewRecord))
        
    }
    
    @objc func saveButtonNewRecord () {
        if newClientsModel.timeService == nil /*|| newClientsModel.dateService == nil || newClientsModel.nameClients == "Имя" || newClientsModel.titleService == "Стоймость" */{
            alertOk(title: "Ошибка", message: "Имя, Услуга, Дата, Время обязательны для заполнения!")
        } else {
            RealmManager.shared.saveNewClientsModel(model: newClientsModel)
            newClientsModel = NewClientsModel()
            //tableView.reloadData()
            self.navigationController?.popViewController(animated: true)
            //dismiss(animated: true)
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! NewClientsRecordTableViewCell
        cell.cellConfigure(nameArray:cellNameArray, indexPath: indexPath)
        
        if indexPath.section <= 1 {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! NewClientsRecordHeaderCell
        header.headerConfigure(section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NewClientsRecordTableViewCell
        
        
        switch indexPath {
            
        case [0,0]: let vc = self.storyboard!.instantiateViewController(withIdentifier: "ClientsMainViewTableViewController") as! ClientsMainViewTableViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        case [1,0] : let vc = self.storyboard!.instantiateViewController(withIdentifier: "ServicesProgramSettingsViewController") as! ServicesProgramSettingsViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            
        case [2,0]:
            alertForCellName(label: cell.labelCell, name: "Стоймость услуги", placeholder: "Введите стоймость услуги") { text in
                self.newClientsModel.priceService = text
            }
            
        case [3,0]:
            alertDate(label: cell.labelCell) { (numberWeekday,date) in
                self.newClientsModel.timeService = date
                //self.newClientsModel.endTimeService = date
                self.newClientsModel.weekDay = numberWeekday
            }
            
        case [4,0]:
            alertTimeWatch(label: cell.labelCell) { (time) in
                self.newClientsModel.timeService = time
            }
            
        case [5,0]:
            alertTimeWatch(label: cell.labelCell) { (endTime) in
                self.newClientsModel.endTimeService = endTime
            }
            
        default:
            print ("Error")
        }
    }
    
    func pushControllers(vc: UITableViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Otions"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
   /* @IBAction func readyAction(_ sender: Any) {
        
        if newClientsModel.timeService == nil /*|| newClientsModel.dateService == nil || newClientsModel.nameClients == "Имя" || newClientsModel.titleService == "Стоймость" */{
            alertOk(title: "Ошибка", message: "Имя, Услуга, Дата, Время обязательны для заполнения!")
        } else {
            RealmManager.shared.saveNewClientsModel(model: newClientsModel)
            newClientsModel = NewClientsModel()
            //tableView.reloadData()
            self.navigationController?.popViewController(animated: true)
            //dismiss(animated: true)
        }
    }*/
    
}
