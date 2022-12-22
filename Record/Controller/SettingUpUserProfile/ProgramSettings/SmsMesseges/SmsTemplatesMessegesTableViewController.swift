//
//  SmsTemplatesMessegesTableViewController.swift
//  Record
//
//  Created by Алешка on 6.10.22.
//

import UIKit

class SmsTemplatesMessegesTableViewController: UITableViewController {

    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"

    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tableView.separatorStyle = .singleLine //DELETE
        
            tableView.register(SmsTemplatesMessegesTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        
        tableView.register(SmsNotificationViewHeader.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 6
            default:
                return 1
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! SmsTemplatesMessegesTableViewCell
            cell.cellConfigure(indexPath: indexPath)
            
            cell.accessoryType = .disclosureIndicator
          
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
        
        if indexPath.row == 0 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "NewEntryTableViewController") as! NewEntryTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 1 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecordingReminderTableViewController") as! RecordingReminderTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 2 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecordChangeSmsTableViewController") as! RecordChangeSmsTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 3 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "CancelRecordingsTableViewController") as! CancelRecordingsTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 4 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "OnlineBookingConfirmationTableViewController") as! OnlineBookingConfirmationTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 5 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SleepingClientsTableViewController") as! SleepingClientsTableViewController
            //cell.accessoryType = .disclosureIndicator
            self.present(vc, animated: true, completion: nil)
        }
      }
    
    @IBAction func readyAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    }
