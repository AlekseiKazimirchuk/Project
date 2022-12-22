//
//  ExpensesTableViewCell.swift
//  Record
//
//  Created by Алешка on 9.08.22.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowExpButton: UIButton!
    @IBOutlet weak var expensesLabel: UILabel!
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowExpButton.addShadow2()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
