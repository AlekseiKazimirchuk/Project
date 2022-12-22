//
//  RecordTableViewCell.swift
//  Record
//
//  Created by Алешка on 2.08.22.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var onlineLabel: UILabel!
    
    @IBOutlet weak var imageClients: UIImageView!
    
    @IBOutlet weak var shadowButton: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowButton.layer.shadowColor = UIColor.darkGray.cgColor
        shadowButton.layer.shadowRadius = 4
        shadowButton.layer.shadowOpacity = 0.5
        shadowButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowButton.layer.cornerRadius = 20
        
        onlineLabel.layer.masksToBounds = true
        onlineLabel.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure (model:NewClientsModel) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        guard let time = model.timeService else {return}
        guard let endTime = model.endTimeService else {return}
        
        startTimeLabel.text = dateFormatter.string(from: time)
        endTimeLabel.text = dateFormatter.string(from: endTime)
        nameLabel.text = model.newNameClients
        serviceLabel.text = model.titleService
        priceLabel.text = model.priceService
        
    }

}
