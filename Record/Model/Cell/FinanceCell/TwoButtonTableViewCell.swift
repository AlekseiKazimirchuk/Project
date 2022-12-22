//
//  TwoButtonTableViewCell.swift
//  Record
//
//  Created by Алешка on 9.08.22.
//

import UIKit

class TwoButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var expensesButton: UIButton!
    
    @IBOutlet weak var incomeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        expensesButton.addShadow()
        incomeButton.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
