//
//  DiscountsSettingsTableViewCell.swift
//  Record
//
//  Created by Алешка on 17.08.22.
//

import UIKit

class DiscountsSettingsTableViewCell: UITableViewCell {

    static let UserNameProgramSettingsViewController = "UserNameProgramSettingsViewController"
    
    static let DiscountsSettingsTableViewCell = "DiscountsSettingsTableViewCell"
    
    private let shadowButton: UIView = {
        let shadowButton = UIView()
     
        shadowButton.layer.cornerRadius = 20
        shadowButton.addShadowView()
        shadowButton.backgroundColor = .white
        //shadowButton.setImage(UIImage.init(named: "right"), for: .normal)
        
       // shadowButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 325, bottom: 0, right: 0)
        
        //shadowButton.addTarget(DiscountsSettingsTableViewCell.self, action: #selector(shadowButtonAction), for: .touchUpInside)
    
        shadowButton.frame = CGRect(x: 2, y: 2, width: 370, height: 65)
        
        return shadowButton
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(shadowButton)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        
        iconContainer.addSubview(iconImageView)
    
        contentView.clipsToBounds = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        
        label.frame = CGRect(x: 55 + iconContainer.frame.size.width, y: 0, width: contentView.frame.size.width - 20 - iconContainer.frame.size.width, height: contentView.frame.size.height)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }
    
    public func configure (with model: SettingsSwitchOptions) {
        
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
    
    @objc func shadowButtonAction(sender: UIButton!){
        print ("yes")
    }
    
}
