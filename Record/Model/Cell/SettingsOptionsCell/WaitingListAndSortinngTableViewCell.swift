//
//  WaitingListAndSortinngTableViewCell.swift
//  Record
//
//  Created by Алешка on 17.08.22.
//

import UIKit

class WaitingListAndSortinngTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


/*let UserSettingTableViewCell = "UserSettingTableViewCell"
let PlaceAndWorkScheduleTableViewCell = "PlaceAndWorkScheduleTableViewCell"
let WeekendsSettingsTableViewCell = "WeekendsSettingsTableViewCell"



override func viewDidLoad() {
    super.viewDidLoad()
    self.registerCell()
    
    
    
}

func registerCell() {
    tableView.register(UINib(nibName: "UserSettingTableViewCell", bundle: nil), forCellReuseIdentifier: "UserSettingTableViewCell")
    tableView.register(UINib(nibName: "WeekendsSettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "WeekendsSettingsTableViewCell")
    tableView.register(UINib(nibName: "PlaceAndWorkScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceAndWorkScheduleTableViewCell")
}
override func numberOfSections(in tableView: UITableView) -> Int {
    return 7
}
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {return 1}
    else if section == 1 {return 2}
    /* else if section == 2 {return 2}
     else if section == 3 {return 2}
     else if section == 4 {return 4}
     else if section == 5 {return 2}
     else if section == 6 {return 3}*/
    
    else {return 1}
}
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserSettingTableViewCell", for: indexPath) as! UserSettingTableViewCell
        
        return cell
    } else if indexPath.section == 1 {
        if indexPath.row == 0 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "WeekendsSettingsTableViewCell", for: indexPath) as! WeekendsSettingsTableViewCell
            
            return cell2
        } else {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "PlaceAndWorkScheduleTableViewCell", for: indexPath) as! PlaceAndWorkScheduleTableViewCell
            
            return cell3
        }
        
    } else {
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "PlaceAndWorkScheduleTableViewCell", for: indexPath) as! PlaceAndWorkScheduleTableViewCell
        
        return cell3
    }
    /*guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserSettingTableViewCell") as? UserSettingTableViewCell else {
     return UITableViewCell()*/
}




}*/
