//
//  SmsNotificationProgramSettingsViewController.swift
//  Record
//
//  Created by Алешка on 2.09.22.
//

import UIKit

class SmsNotificationProgramSettingsViewController: UITableViewController {

    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"

    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tableView.separatorStyle = .singleLine
        
            tableView.register(SmsNotificationViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        
        tableView.register(SmsNotificationViewHeader.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 3
            default:
                return 1
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! SmsNotificationViewCell
            cell.cellConfigure(indexPath: indexPath)
            
            if indexPath.row == 1 {
                cell.accessoryType = .disclosureIndicator
            } else if indexPath.row == 2 {
                cell.accessoryType = .disclosureIndicator
            }
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
         
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SmsMessengersToSendTableViewController") as! SmsMessengersToSendTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 2 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SmsTemplatesMessegesTableViewController") as! SmsTemplatesMessegesTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
      }
    
    @IBAction func readyAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    }
