//
//  HaircutsTableViewCell.swift
//  Record
//
//  Created by Алешка on 9.08.22.
//

import UIKit

class HaircutsTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowHairButton: UIButton!
    @IBOutlet weak var haircutsLabel: UILabel!
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowHairButton.addShadow2()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
