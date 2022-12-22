//
//  FinanceViewController.swift
//  Record
//
//  Created by Алешка on 9.08.22.
//

import UIKit


class FinanceViewController: UIViewController {

    @IBOutlet weak var financeTableView: UITableView!
    
    
    let MonthCell = "MonthCell"
    let ExpensesCell = "ExpensesCell"
    let IncomeCell = "IncomeCell"
    let HaircutsCell = "HaircutsCell"
    let TwoButtonCell = "TwoButtonCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        financeTableView.dataSource = self
        financeTableView.delegate = self
        
    }
}

extension FinanceViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {return 1}
        else if section == 1 {return 1}
        else if section == 2 {return 1}
        else if section == 3 {return 1}
           else {return 1}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
               let cell = financeTableView.dequeueReusableCell(withIdentifier: "MonthCell", for: indexPath) as! MonthTableViewCell
               
               return cell
           } else if indexPath.section == 1 {
               let cell2 = financeTableView.dequeueReusableCell(withIdentifier: "TwoButtonCell", for: indexPath) as! TwoButtonTableViewCell
              
               return cell2
           } else if indexPath.section == 2 {
               let cell3 = financeTableView.dequeueReusableCell(withIdentifier: "IncomeCell", for: indexPath) as! IncomeTableViewCell
              
               return cell3
           } else if indexPath.section == 3 {
               let cell4 = financeTableView.dequeueReusableCell(withIdentifier: "HaircutsCell", for: indexPath) as! HaircutsTableViewCell
               
               return cell4
    } else {
        let cell5 = financeTableView.dequeueReusableCell(withIdentifier: "ExpensesCell", for: indexPath) as! ExpensesTableViewCell
        
        return cell5
    }
    
}
}
