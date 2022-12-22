//
//  CopyToPhoneProgramSettingsViewController.swift
//  Record
//
//  Created by Алешка on 2.09.22.
//

import UIKit

class CopyToPhoneProgramSettingsViewController: UITableViewController {

let idOptionsSheduleCell = "idOptionsSheduleCell"
let idOptionsSheduleHeader = "idOptionsSheduleHeader"

override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorStyle = .singleLine //DELETE
    
        tableView.register(CopyToPhoneTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
}
    
override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 3
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        switch section {
        case 0: return 2
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! CopyToPhoneTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
        
    }
    
override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
     if indexPath.row == 0 {
         return 100
     } else {
         return 45
     }
}
    
    @IBAction func readyAction(_ sender: Any) {
        dismiss(animated: true)
    }
}


        
    
    
        
        
    
  
        
   


    
