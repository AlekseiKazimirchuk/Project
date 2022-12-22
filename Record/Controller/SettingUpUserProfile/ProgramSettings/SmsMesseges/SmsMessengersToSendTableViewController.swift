//
//  SmsMessengersToSendTableViewController.swift
//  Record
//
//  Created by Алешка on 6.10.22.
//

import UIKit

class SmsMessengersToSendTableViewController: UITableViewController {

    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"

    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tableView.separatorStyle = .singleLine
        
            tableView.register(SmsMessengersToSendCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        
            tableView.register(SmsNotificationViewHeader.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 5
            default:
                return 1
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! SmsMessengersToSendCell
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
         
        return 44
    }
    
    @IBAction func readyAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    }
