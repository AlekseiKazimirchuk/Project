//
//  SmsTemplatesMessegesTableViewCell.swift
//  Record
//
//  Created by Алешка on 6.10.22.
//

import UIKit

class SmsTemplatesMessegesTableViewCell: UITableViewCell {

    let labelCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   let cellNameArray = ["Новая запись","Напоминание о записи","Изменение записи","Отмена записи","Подтверждение онлайн запись","Спящие клиенты"]
   
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
      setConstraints()
       
       self.selectionStyle = .none
       self.backgroundColor = .clear
       
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   func cellConfigure(indexPath: IndexPath){
       if indexPath.row <= 6 {
           labelCell.text = cellNameArray[indexPath.row]
           
       }
        }
   
   func setConstraints (){
       
      self.addSubview(labelCell)
       NSLayoutConstraint.activate([
        
           labelCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           labelCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
          ])
    }
}
