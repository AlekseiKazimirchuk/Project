//
//  AddServiceTableViewController.swift
//  Record
//
//  Created by Алешка on 27.09.22.
//

import UIKit
import RealmSwift

class AddServiceTableViewController: UITableViewController {
    
    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"
    
    var cellNameArray = ["Введите навание услуги","Стоймость","Комментарий"]
    
    var serviceArray = ServicePriceCommentModel()
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
            tableView.register(AddServiceTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
            
            tableView.register(AddServiceTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
            
    }
        
    @IBAction func addServiceButton(_ sender: Any) {
        
        if serviceArray.haircat == "" /*|| newClientsModel.dateService == nil || newClientsModel.nameClients == "Имя" || newClientsModel.titleService == "Стоймость" */{
            alertOk(title: "Ошибка", message: "Имя, Услуга, Дата, Время обязательны для заполнения!")
        } else {
            RealmManager.shared.saveServicePriceCommentModel(model: serviceArray)
            serviceArray = ServicePriceCommentModel()
            //tableView.reloadData()
            self.navigationController?.popViewController(animated: true)
            //dismiss(animated: true)
        }
        
    }
    
       override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! AddServiceTableViewCell
            cell.cellConfigure(nameArray: cellNameArray,indexPath: indexPath)
            return cell
            
        }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 50
       
     }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! AddServiceTableViewHeaderFooterView
        header.headerConfigure(section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AddServiceTableViewCell
        
        switch indexPath {
            
        case [0,0]:
            alertForCellName(label: cell.labelService, name: "Услуга", placeholder: "Введите название услуги") { text in
                self.serviceArray.haircat = text
            }
            
        case [0,1]:
            alertForCellName(label: cell.labelService, name: "Стоймость услуги", placeholder: "Введите стоймость услуги") { text in
                self.serviceArray.priceService = text
            }
            
        case [0,2]:
            alertForCellName(label: cell.labelService, name: "Комментарий", placeholder: "Введите комментарий") { text in
                self.serviceArray.comment = text
            }
            
        default:
            print ("Error")
       
        }
      }
    }
