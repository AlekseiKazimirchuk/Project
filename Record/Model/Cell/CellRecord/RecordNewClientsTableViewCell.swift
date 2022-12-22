//
//  RecordNewClientsTableViewCell.swift
//  Record
//
//  Created by Алешка on 3.11.22.
//

import UIKit

class RecordNewClientsTableViewCell: UITableViewCell {

    
    let labelCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let labelCellTwo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellNameArray = [["Выберите клиента"],
                        ["Выбрать услугу"],
                        ["Дата","Начало и окончание услуги"],
                        ["Стоймость услуги"],
                         ["Напоминание клиенту","Напомнить за: "],
                         ["Заметка: "]]
    
    let cellArray = ["Имя","Фамилия","Дата Рождения","Номер телефона","Email","Специализация","Instagram","Facebook","Расскажите о вашем опыте работы"]
    
   let nameArray = ["Имя","Фамилия","Дата Рождения","Номер телефона","Email","Специализация"]
    let specializationArray = ["Специализация"]
    let networksArray = ["Instagram","Facebook"]
    let worksArray = ["Расскажите о вашем опыте работы"]
    
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
      if indexPath.section <= 5 {
          labelCell.text = cellNameArray[indexPath.section][indexPath.row]
       } /*else if indexPath.section == 1 {
           labelCell.text = nameArray[indexPath.row]
       } else if indexPath.section == 2 {
           labelCell.text = specializationArray[indexPath.row]
       } else if indexPath.section == 3 {
           labelCell.text = networksArray[indexPath.row]
       } else if indexPath.section == 4 {
           labelCellTwo.text = worksArray[indexPath.row]
       }*/
       
   }
   
   @objc func switchAction (paramTarget: UISwitch) {
       
   }
   
   
   func setConstraints (){
       
       self.addSubview(labelCell)
       NSLayoutConstraint.activate([
           labelCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           labelCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
          ])
       
      /* self.addSubview(labelCellTwo)
       NSLayoutConstraint.activate([
           //labelCellTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           labelCellTwo.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
           labelCellTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
           labelCellTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
           labelCellTwo.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
          ])*/
       
      
       
   }
}
