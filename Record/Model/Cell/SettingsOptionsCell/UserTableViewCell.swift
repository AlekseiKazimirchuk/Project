//
//  UserTableViewCell.swift
//  Record
//
//  Created by Алешка on 10.08.22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
   
    

    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }

   
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        userLabel.text = nil
    }
    public func configure(with model: SettingsOption) {
        userLabel.text = model.title
    }*/
}
