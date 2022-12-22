//
//  SettingsClientsProfileTableViewCell.swift
//  Record
//
//  Created by Алешка on 29.10.22.
//

import UIKit

class SettingsClientsProfileTableViewCell: UITableViewCell {

    let imageCell: UIImageView = {
        let imageCell = UIImageView(image: UIImage(named: "addUser"))
        imageCell.clipsToBounds = true
        //imageCell.frame.size = CGSize(width: 50, height: 50)
        imageCell.layer.borderWidth = 2.0
        imageCell.layer.borderColor = UIColor.black.cgColor
        imageCell.layer.cornerRadius = 25
        imageCell.contentMode = .scaleAspectFill
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.isHidden = true
        return imageCell
    }()
    
    let addPhotoClients: UILabel = {
        let label = UILabel()
        
        label.text = "Добавить фото клиента"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    
    let nameUserLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Имя"
       label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
       return label
   }()
    
    let surNameLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Фамилия"
       label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
       return label
   }()
   
   let phoneUserLabel: UILabel = {
      let label = UILabel()
       
       //label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       //labelTimeCell.numberOfLines = 1
       label.text = "Номер телефона"
       label.translatesAutoresizingMaskIntoConstraints = false
       label.isHidden = true
      return label
  }()
    
   
    let dateLabel: UILabel = {
       let label = UILabel()
        
       label.text = "Дата рождения"
       label.numberOfLines = 1
       label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
       return label
   }()
    
    let instaLabel: UILabel = {
       let label = UILabel()
        
       label.text = "Instagram"
       label.numberOfLines = 1
       label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
       return label
   }()
    
    let faceLabel: UILabel = {
       let label = UILabel()
        
       label.text = "Facebook"
       label.numberOfLines = 1
       label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
       return label
   }()
    
    
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
       
       /* if indexPath.section == 0 {
           imageCell.isHidden = false
           nameUserLabel.text = nameUserArray[indexPath.row]
           phoneUserLabel.text = phoneUserArray[indexPath.row]
       }else if indexPath.section <= 4 {
           cellLabel.text = cellLabelArray[indexPath.section][indexPath.row]
       }*/
       
       switch indexPath {
       case [0,0]:
           imageCell.isHidden = false
           addPhotoClients.isHidden = false
           
       case [0,1]:
           nameUserLabel.isHidden = false
       case [0,2]:
           surNameLabel.isHidden = false
       case [0,3]:
           dateLabel.isHidden = false
       case [0,4]:
           phoneUserLabel.isHidden = false
       case [0,5]:
           instaLabel.isHidden = false
       case [0,6]:
           faceLabel.isHidden = false
       default:
           print ("Error")
       }
       
       
     
       }
   
   func setConstraints (){
       
       self.addSubview(imageCell)
       NSLayoutConstraint.activate([
       
        imageCell.heightAnchor.constraint(equalToConstant: 50),
        imageCell.widthAnchor.constraint(equalToConstant: 50),
        
        imageCell.topAnchor.constraint(equalTo: self.topAnchor,constant: 25),
        imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)

       ])
       
       self.addSubview(addPhotoClients)
       NSLayoutConstraint.activate([
        addPhotoClients.topAnchor.constraint(equalTo: self.topAnchor,constant: 40),
        addPhotoClients.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor,constant: 20)
       ])
        
       
       self.addSubview(nameUserLabel)
       NSLayoutConstraint.activate([
        nameUserLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        nameUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
       ])
       
       self.addSubview(surNameLabel)
       NSLayoutConstraint.activate([
           
        surNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        surNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
       ])
       
       self.addSubview(phoneUserLabel)
       NSLayoutConstraint.activate([
        
        phoneUserLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        phoneUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
       ])
       
       self.addSubview(dateLabel)
       NSLayoutConstraint.activate([
        
        dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
       ])
       
       self.addSubview(instaLabel)
       NSLayoutConstraint.activate([
        
        instaLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        instaLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
       ])
       
       self.addSubview(faceLabel)
       NSLayoutConstraint.activate([
        
           faceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           faceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
          ])
       
    
   }
   
}
