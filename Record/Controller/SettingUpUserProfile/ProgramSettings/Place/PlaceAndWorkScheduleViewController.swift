//
//  PlaceAndWorkScheduleViewController.swift
//  Record
//
//  Created by Алешка on 2.09.22.
//

import UIKit

class PlaceAndWorkScheduleViewController: UITableViewController {
        
    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tableView.separatorStyle = .singleLine
        
            tableView.register(CellPlaceAndWorkTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
            
            tableView.register(HeaderPlaceAndWorkTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
            
    }
        
   override func numberOfSections(in tableView: UITableView) -> Int {
            return 3
        }
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 1
            case 1: return 4
            case 2: return 7
            default:
                return 1
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! CellPlaceAndWorkTableViewCell
            cell.cellConfigure(indexPath: indexPath)
            return cell
            
        }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         return 44
        
     }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! HeaderPlaceAndWorkTableViewCell
        header.headerConfigure(section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CellPlaceAndWorkTableViewCell
        
        if indexPath.section == 2{
            alertTime(label: cell.labelTimeCell) { (date) in
                print (date)
            }
        }
        
        if indexPath.section == 0 {
            
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SettingsCountryViewControllerTableViewController") as! SettingsCountryViewControllerTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
        
        switch indexPath {
        
        case [2,0]: alertTime(label: cell.labelTimeCell) { (date) in
            print (date)
        }
        
        case [1,0]: alertForCellName(label: cell.labelCell, name: "Название салона", placeholder: "Введите название салона") { text in
            print (text)
        }
            
        case [1,1]: alertForCellName(label: cell.labelCell, name: "Город", placeholder: "Введите название города") { text in
            print (text)
        }
            
        case [1,2]: alertForCellName(label: cell.labelCell, name: "Адрес", placeholder: "Введите адрес") { text in
            print (text)
        }
            
        case [1,3]: alertForCellName(label: cell.labelCell, name: "Комментарий", placeholder: "Комментарий") { text in
            print (text)
        }
            
        default:
            print ("Error")
        }
    }
   
    @IBAction func readyAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
        }
       
        
        

