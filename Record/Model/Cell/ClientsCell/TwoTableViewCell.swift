//
//  TwoTableViewCell.swift
//  Record
//
//  Created by Алешка on 10.07.22.
//

import UIKit

class TwoTableViewCell: UITableViewCell {
    @IBOutlet weak var faceImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var clientButton: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clientButton.layer.shadowColor = UIColor.darkGray.cgColor
        clientButton.layer.shadowRadius = 5
        clientButton.layer.shadowOpacity = 0.4
        clientButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        clientButton.layer.cornerRadius = 20
        faceImage.contentMode = .scaleAspectFit
        faceImage.clipsToBounds = true
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: ContactMode) {
        
        nameLabel.text = model.nameClients
        numberLabel.text = model.phoneClients
        
        if let data = model.imageClients, let image = UIImage (data: data) {
            faceImage.image = image
        } else {
            faceImage.image = UIImage(named: "2portrait")
        }
            
            
       /*/ guard let data = model.imageClients, let image = UIImage (data: data) else {return}
        faceImage.image = image*/
    }

}
