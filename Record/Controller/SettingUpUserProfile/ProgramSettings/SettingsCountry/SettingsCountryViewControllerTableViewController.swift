//
//  SettingsCountryViewControllerTableViewController.swift
//  Record
//
//  Created by Алешка on 27.09.22.
//

import UIKit

class SettingsCountryViewControllerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    @IBAction func closedAction(_ sender: Any) {
        
        dismiss(animated: true)
    }
}
