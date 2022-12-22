//
//  AllClientsTableViewController.swift
//  Record
//
//  Created by Алешка on 18.10.22.
//

import UIKit

class EntryClientsTableViewController: UITableViewController {

    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"

    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tableView.separatorStyle = .singleLine //DELETE
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            tableView.register(EntryClientsTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        
            tableView.register(EntryClientsHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 5
        }
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 2
            case 1: return 1
            case 2: return 1
            case 3: return 1
            case 4: return 1
            default:
                return 1
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! EntryClientsTableViewCell
            cell.cellConfigure(indexPath: indexPath)
            
            if indexPath.section == 1 {
                cell.accessoryType = .disclosureIndicator
            } else if indexPath.section == 2 {
                cell.accessoryType = .disclosureIndicator
            } else if indexPath.section == 3 {
                cell.accessoryType = .disclosureIndicator
            }
           return cell
            
        }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! EntryClientsHeaderFooterView
        header.headerConfigure(section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 4 {
            return 10
        } else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath {
        case [0,0]:
            return 200
        case [0,1]:
            return 60
        default:
            return 44
        }
        /*if indexPath.row == 0 {
            return 250
        } else {
    return 44
        }*/
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! EntryClientsTableViewCell
        
        switch indexPath {
            
       
        //case [1,0]: alertForCellName(label: cell.labelCell, name: "Имя", placeholder: "Введите имя")
        /*case [2,0]:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SettingsClientsProfileTableViewController") as! SettingsClientsProfileTableViewController
            
            self.present(vc, animated: true, completion: nil)*/
            /*case [1,2]: alertTimeWatch(label: cell.labelCell) { (date) in
            print (date)}
        case [1,3]: alertForCellName(label: cell.labelCell, name: "Номер телефона", placeholder: "Введите номер телефона")
        case [1,4]: alertForCellName(label: cell.labelCell, name: "Email", placeholder: "Введите email")
        case [2,0]: alertForCellName(label: cell.labelCell, name: "Специализация", placeholder: "Введите специализацию")
        case [3,0]: alertForCellName(label: cell.labelCell, name: "Instagram", placeholder: "Введите ссылку на Instagram")
        case [3,1]: alertForCellName(label: cell.labelCell, name: "Facebook", placeholder: "Введите ссылку на Facebook")
        case [4,0]: alertForCellName(label: cell.labelCellTwo, name: "О себе", placeholder: "Расскажите о себе")*/
        default:
            print ("Error")
        }
           
        
    }
    
  
    @IBAction func readyAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    }

