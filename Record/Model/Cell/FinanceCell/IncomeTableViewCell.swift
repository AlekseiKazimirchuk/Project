//
//  IncomeTableViewCell.swift
//  Record
//
//  Created by Алешка on 9.08.22.
//

import UIKit

class IncomeTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowIncButton: UIButton!
    @IBOutlet weak var incomeLabel: UILabel!
    
    @IBOutlet weak var moneyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowIncButton.addShadow2()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
