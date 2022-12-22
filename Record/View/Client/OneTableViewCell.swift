//
//  OneTableViewCell.swift
//  Record
//
//  Created by Алешка on 12.07.22.
//

import UIKit

class OneTableViewCell: UITableViewCell {
    @IBOutlet weak var allClients: UIButton!
    
    @IBOutlet weak var newClients: UIButton!
    
    @IBOutlet weak var waitingList: UIButton!
    
    @IBOutlet weak var sleepingClietns: UIButton!
    
    @IBOutlet weak var birthdays: UIButton!
    
    @IBOutlet weak var blockedClients: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        allClients.layer.shadowColor = UIColor.darkGray.cgColor
        allClients.layer.shadowRadius = 4
        allClients.layer.shadowOpacity = 0.5
        allClients.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        newClients.layer.shadowColor = UIColor.darkGray.cgColor
        newClients.layer.shadowRadius = 4
        newClients.layer.shadowOpacity = 0.5
        newClients.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        waitingList.layer.shadowColor = UIColor.darkGray.cgColor
        waitingList.layer.shadowRadius = 4
        waitingList.layer.shadowOpacity = 0.5
        waitingList.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        sleepingClietns.layer.shadowColor = UIColor.darkGray.cgColor
        sleepingClietns.layer.shadowRadius = 4
        sleepingClietns.layer.shadowOpacity = 0.5
        sleepingClietns.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        birthdays.layer.shadowColor = UIColor.darkGray.cgColor
        birthdays.layer.shadowRadius = 4
        birthdays.layer.shadowOpacity = 0.5
        birthdays.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        blockedClients.layer.shadowColor = UIColor.darkGray.cgColor
        blockedClients.layer.shadowRadius = 4
        blockedClients.layer.shadowOpacity = 0.5
        blockedClients.layer.shadowOffset = CGSize(width: 0, height: 0)
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
