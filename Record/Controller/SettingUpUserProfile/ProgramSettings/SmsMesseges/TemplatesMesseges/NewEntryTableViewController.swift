//
//  NewEntryTableViewController.swift
//  Record
//
//  Created by Алешка on 6.10.22.
//

import UIKit

class NewEntryTableViewController: UITableViewController {

    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"

    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tableView.separatorStyle = .singleLine //DELETE
        
            tableView.register(NewEntryTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        
            tableView.register(SmsNotificationViewHeader.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 2
            default:
                return 1
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! NewEntryTableViewCell
            cell.cellConfigure(indexPath: indexPath)
            
          
            return cell
            
        }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! SmsNotificationViewHeader
        header.headerConfigure(section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
        } else {
        return 44
    }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! NewEntryTableViewCell
        
        switch indexPath {
        case [0,0]: alertForCellName(label: cell.labelCellTwo, name: "Сообщение", placeholder: "Введите сообщение") { text in
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

