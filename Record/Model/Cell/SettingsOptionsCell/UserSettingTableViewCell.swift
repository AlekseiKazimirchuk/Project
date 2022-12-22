//
//  UserSettingTableViewCell.swift
//  Record
//
//  Created by Алешка on 15.08.22.
//

import UIKit

class UserSettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shadowButton: UIButton!
    
    @IBOutlet weak var photoUserImageView: UIImageView!
    
    @IBOutlet weak var nameUserLabel: UILabel!

    @IBOutlet weak var phoneUserLabel: UILabel!
    
    @IBOutlet weak var rightButton: UIButton!
    
    
    static let UserSettingTableViewCell = "UserSettingTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        //contentView.clipsToBounds = true
        //accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
   /* override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }*/
public func configure (with model: SettingsOption) {
        nameUserLabel.text = model.title
        //phoneUserLabel.text = model.title
        photoUserImageView.image = model.icon
        
    }
    
}
