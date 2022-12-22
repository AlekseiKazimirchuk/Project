//
//  RecordingNewTableViewCell.swift
//  Record
//
//  Created by Алешка on 18.10.22.
//

import UIKit

class RecordingNewTableViewCell: UITableViewCell {

    let imageUser: UIImageView = {
        let imageUser = UIImageView()
        return imageUser
    }()
    
    let buttonShadow: UIButton = {
        let buttonCell = UIButton()
        
        return buttonCell
    }()
    
    let nameUserCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let serviceUserCell: UILabel = {
        let label = UILabel()
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let onlineCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let timeStartCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let timeEndCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let userNameArray = ["Иван Иванов","Петька Петров","Вудский Дед","Николай Петров","Алексей Казимирчик","Евгений Мамонтов","Сергей Шуруп","Иван Кажуков"]
    
    let serviceUserArray = ["стрижка+борода"]
    
    let priceArray = ["95Br"]
    
    let onlineArray = ["Онлайн запись"]
    
    let timeStartArray = ["10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00"]
    
    let timeEndArray = ["11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00"]
    
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
      if indexPath.row <= 8 {
          nameUserCell.text = userNameArray[indexPath.row]
          serviceUserCell.text = serviceUserArray[indexPath.row]
          priceCell.text = priceArray[indexPath.row]
          onlineCell.text = onlineArray[indexPath.row]
          timeStartCell.text = timeStartArray[indexPath.row]
          timeEndCell.text = timeEndArray[indexPath.row]
      }
       
   }
   
   @objc func switchAction (paramTarget: UISwitch) {
       
   }
   
   func setConstraints (){
       
       self.addSubview(buttonShadow)
       NSLayoutConstraint.activate([
       
        buttonShadow.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
        buttonShadow.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
        buttonShadow.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
        buttonShadow.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
       ])
       
       self.addSubview(imageUser)
        NSLayoutConstraint.activate([
            imageUser.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageUser.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
           ])
       
      self.addSubview(nameUserCell)
       NSLayoutConstraint.activate([
           nameUserCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           nameUserCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
          ])
       
       self.addSubview(serviceUserCell)
       NSLayoutConstraint.activate([
           //labelCellTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           serviceUserCell.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
           serviceUserCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
           serviceUserCell.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
           serviceUserCell.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
          ])
       
       self.addSubview(priceCell)
        NSLayoutConstraint.activate([
            priceCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            priceCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
           ])
       
       self.addSubview(onlineCell)
        NSLayoutConstraint.activate([
            onlineCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            onlineCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
           ])
       
       self.addSubview(timeStartCell)
        NSLayoutConstraint.activate([
            timeStartCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timeStartCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
           ])
       
       self.addSubview(timeEndCell)
        NSLayoutConstraint.activate([
            timeEndCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timeEndCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
           ])
       }
}
