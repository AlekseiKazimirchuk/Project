//
//  SmsNotificationViewCell.swift
//  Record
//
//  Created by Алешка on 4.10.22.
//

import UIKit

class SmsNotificationViewCell: UITableViewCell {

    let labelCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
    let reapeatSwitch:UISwitch = {
       let reapeatSwitch = UISwitch()
       reapeatSwitch.isOn = true
       reapeatSwitch.isHidden = true
       reapeatSwitch.onTintColor = #colorLiteral(red: 0.5019338131, green: 0.5388896465, blue: 0.6109331846, alpha: 1)
       reapeatSwitch.translatesAutoresizingMaskIntoConstraints = false
       return reapeatSwitch
   }()
   
   let cellNameArray = ["Включить уведомления","Мессенджеры для отправки","Шаблоны уведомлений"]
   
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
      setConstraints()
       
       self.selectionStyle = .none
       self.backgroundColor = .clear
       
       reapeatSwitch.addTarget(self, action: #selector(switchAction(paramTarget:)), for: .valueChanged)
      
     // contentView.clipsToBounds = true
      // accessoryType = .disclosureIndicator
     
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   func cellConfigure(indexPath: IndexPath){
       if indexPath.row <= 2 {
           labelCell.text = cellNameArray[indexPath.row]
           //reapeatSwitch.isHidden = false
       }
        if indexPath.row == 0 {
           reapeatSwitch.isHidden = false
       
       }
      
   }
   
   @objc func switchAction (paramTarget: UISwitch) {
       
   }
   
   
   func setConstraints (){
       
      self.addSubview(labelCell)
       NSLayoutConstraint.activate([
           labelCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           labelCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
          ])
       
       self.contentView.addSubview(reapeatSwitch)
       NSLayoutConstraint.activate([
           reapeatSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           reapeatSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20)
          ])
       
   }
}
