//
//  ProbaNomerOneTableViewCell.swift
//  Record
//
//  Created by Алешка on 4.12.22.
//

import UIKit
import RealmSwift

class ProbaNomerOneTableViewCell: UITableViewCell {
    
    let imageUserOne: UIImageView = {
        let imageUser = UIImageView()
        return imageUser
    }()
    
  
    
    let nameUserCellOne: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let serviceUserCellOne: UILabel = {
        let label = UILabel()
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    let userNameArray = ["Иван Иванов","Петька Петров","Вудский Дед","Николай Петров","Алексей Казимирчик","Евгений Мамонтов","Сергей Шуруп","Иван Кажуков"]
    var model = ContentMode(rawValue: <#Int#>)
    
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
      setConstraints()
       
       self.selectionStyle = .none
       self.backgroundColor = .clear
       

   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   func cellConfigure(model: ContentMode){
      
       
      }
       
   }
   
 
   
   
func setConstraints (){
    
    
    
    self.addSubview(imageUserOne)
    NSLayoutConstraint.activate([
        imageUserOne.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        imageUserOne.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
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
    
}
      
       


