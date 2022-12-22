//
//  WeekendsSettingsTableViewCell.swift
//  Record
//
//  Created by Алешка on 17.08.22.
//

import UIKit

class WeekendsSettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var weekendsLabel: UILabel!
    
 
    
       static let DiscountsSettingsTableViewCell = "DiscountsSettingsTableViewCell"
       
       
       
       
       
       
       
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           /*contentView.clipsToBounds = true
           accessoryType = .none*/
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       override func layoutSubviews() {
           super.layoutSubviews()
           
        func prepareForReuse() {
           super.prepareForReuse()
          
       }
         func configure (with model: SettingsSwitchOptions) {
           weekendsLabel.text = model.title
           
       }
       }
}
