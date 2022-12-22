//
//  MessagesTableViewCell.swift
//  Record
//
//  Created by Алешка on 26.07.22.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowButton: UIButton!
    
    @IBOutlet weak var imageClients: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var messagesLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
 
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowButton.layer.shadowColor = UIColor.darkGray.cgColor
        shadowButton.layer.shadowRadius = 4
        shadowButton.layer.shadowOpacity = 0.5
        shadowButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowButton.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
