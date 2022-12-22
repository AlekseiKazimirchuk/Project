//
//  NewServiceAddTableViewController.swift
//  Record
//
//  Created by Алешка on 14.11.22.
//

import UIKit

class NewServiceAddTableViewController: UITableViewController {

    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //tableView.separatorStyle = .singleLine //DELETE
        
            tableView.register(NewServiceAddCellTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
            
            tableView.register(AddServiceTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
            
    }
        
   override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! NewServiceAddCellTableViewCell
            
           // cell.cellConfigure(indexPath: indexPath)
            return cell
            
        }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 44
        /* if indexPath.section == 0 {
             return 70
         } else {
             return 45
         }
         }*/
     }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! AddServiceTableViewHeaderFooterView
        header.headerConfigure(section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
   /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AddServiceTableViewCell
        
        
        if indexPath.row <= 3 {
            
            
            
            /* } else if indexPath.row == 3 {
             alertTimeWatch(label: cell.labelCell) { (date) in
             print (date)
             }
             
             
             }*/
        }
    }*/
   
    @IBAction func closedAction(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
        }
