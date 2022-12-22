//
//  MonthTableViewCell.swift
//  Record
//
//  Created by Алешка on 9.08.22.
//

import UIKit

class MonthTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowButton: UIButton!
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var moneyMonthLabel: UILabel!
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowButton.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
