//
//  AllClientsTableViewCell.swift
//  Record
//
//  Created by Алешка on 18.10.22.
//

import UIKit

class EntryClientsTableViewCell: UITableViewCell {

    let imageCell: UIImageView = {
        let imageCell = UIImageView(image: UIImage(named: "addUser"))
        imageCell.clipsToBounds = true
        imageCell.frame.size = CGSize(width: 95, height: 95)
        //imageCell.layer.borderWidth = 5.0
        //imageCell.layer.borderColor = UIColor.black.cgColor
        imageCell.layer.cornerRadius = 48
        imageCell.contentMode = .scaleAspectFit
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.isHidden = true
        return imageCell
    }()
    
    
    let nameUserLabel: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   let phoneUserLabel: UILabel = {
      let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       //labelTimeCell.numberOfLines = 1
       label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
    
    let callClients: UIButton = {
         let button = UIButton()
    
        button.setImage(UIImage(named: "allClients"), for: .normal)
        button.setTitle("Позвонить", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        //button.frame.size = CGSize(width: 100, height: 50)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        button.alignVertical(spacing: 5.0, lang: "Ru")
        button.backgroundColor = .white
        button.addShadow()
        
         button.layer.cornerRadius = 20
         button.translatesAutoresizingMaskIntoConstraints = false
         button.isHidden = true
         return button
     }()
    
    let writeClients: UIButton = {
         let button = UIButton()
    
        button.setImage(UIImage(named: "allClients"), for: .normal)
        button.setTitle("Написать", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        button.alignVertical(spacing: 5.0, lang: "Ru")
        button.backgroundColor = .white
        button.addShadow()
        
         button.layer.cornerRadius = 20
         button.translatesAutoresizingMaskIntoConstraints = false
         button.isHidden = true
         return button
     }()
    
    let recordClients: UIButton = {
         let button = UIButton()
    
        button.setImage(UIImage(named: "allClients"), for: .normal)
        button.setTitle("Записать", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        button.alignVertical(spacing: 5.0, lang: "Ru")
        button.backgroundColor = .white
        button.addShadow()
        
         button.layer.cornerRadius = 20
         button.translatesAutoresizingMaskIntoConstraints = false
         button.isHidden = true
         return button
     }()
    
    let cellLabel: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let deleteButton: UIButton = {
         let button = UIButton()
    
        //button.setImage(UIImage(named: "allClients"), for: .normal)
        button.setTitle("Удалить клиента", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        //button.alignVertical(spacing: 5.0, lang: "Ru")
        //button.backgroundColor = .white
        //button.addShadow()
        
        // button.layer.cornerRadius = 20
         button.translatesAutoresizingMaskIntoConstraints = false
         button.isHidden = true
         return button
     }()
    
    let nameUserArray = ["Иван Иванов"]
   
   
                   let cellLabelOne = ["Прошедшие записи"]
                   let cellLabelTwo = ["Настройка профиля клиента"]
                   let cellLabelTree = ["Заметки"]
                   //let cellLabelFour = ["Удалить клиента"]
   
   let phoneUserArray = ["+375447806668"]

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
       
       switch indexPath {
       case [0,0]:
           imageCell.isHidden = false
           nameUserLabel.text = nameUserArray[indexPath.row]
           phoneUserLabel.text = phoneUserArray[indexPath.row]
       case [0,1]:
           callClients.isHidden = false
           writeClients.isHidden = false
           recordClients.isHidden = false
       case [1,0]:
           cellLabel.text = cellLabelOne [indexPath.row]
       case [2,0]:
           cellLabel.text = cellLabelTwo [indexPath.row]
       case [3,0]:
           cellLabel.text = cellLabelTree [indexPath.row]
       case [4,0]:
           deleteButton.isHidden = false
       default:
           print ("Error")
       }
       
       }
   
   func setConstraints (){
       
       self.addSubview(imageCell)
       NSLayoutConstraint.activate([
       
        imageCell.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
        imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 140),
        imageCell.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -140),
        imageCell.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -140)
       ])
        
       
       self.addSubview(nameUserLabel)
       NSLayoutConstraint.activate([
           //labelOneCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           nameUserLabel.topAnchor.constraint(equalTo: imageCell.bottomAnchor,constant: 20),
           
           nameUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 135),
           nameUserLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -135)
          ])
       
       self.addSubview(phoneUserLabel)
       NSLayoutConstraint.activate([
           
           phoneUserLabel.topAnchor.constraint(equalTo: nameUserLabel.bottomAnchor,constant: 5),
       phoneUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 120),
           phoneUserLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -120)
       ])
       
       self.addSubview(callClients)
       NSLayoutConstraint.activate([
        
        callClients.heightAnchor.constraint(equalToConstant: 50),
        callClients.widthAnchor.constraint(equalToConstant: 100),
        callClients.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        callClients.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
       // callClients.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
        /*callClients.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5),
        callClients.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10)*/
        
        
       ])
       
       self.addSubview(writeClients)
       NSLayoutConstraint.activate([
        
        writeClients.heightAnchor.constraint(equalToConstant: 50),
        writeClients.widthAnchor.constraint(equalToConstant: 100),
        
        writeClients.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        writeClients.leadingAnchor.constraint(equalTo: callClients.trailingAnchor,constant: 27)
      /*  writeClients.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
        writeClients.leftAnchor.constraint(equalTo: callClients.rightAnchor,constant: 40)*/
        
        
        
       ])
       
       self.addSubview(recordClients)
       NSLayoutConstraint.activate([
        
        recordClients.heightAnchor.constraint(equalToConstant: 50),
        recordClients.widthAnchor.constraint(equalToConstant: 100),
        
        recordClients.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        recordClients.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10)
       /* recordClients.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5),
        recordClients.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10)*/
        
        
       ])
       
       self.addSubview(cellLabel)
       NSLayoutConstraint.activate([
           cellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           cellLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
          ])
       
       self.addSubview(deleteButton)
       NSLayoutConstraint.activate([
           deleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           deleteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 110)
          ])
       
       
       
       
   }
   
}
