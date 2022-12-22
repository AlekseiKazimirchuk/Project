//
//  UserViewController.swift
//  Record
//
//  Created by Алешка on 10.08.22.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    let userCell = "userCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Секция \(section)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: userCell) as! UserTableViewCell
        
        cell.settingsLabel.text = "Test"
        //cell.rightButton
        
        return cell
    }
    
    

