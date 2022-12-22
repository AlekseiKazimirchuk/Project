//
//  ClietnsMainViewTableViewCell.swift
//  Record
//
//  Created by Алешка on 18.10.22.
//

import UIKit

class ClietnsMainViewTableViewCell: UITableViewCell {
    
  /*  let imageCell: UIImageView = {
        let imageCell = UIImageView(image: UIImage(named: "2portrait"))
        imageCell.clipsToBounds = true
        //imageCell.frame.size = CGSize(width: 25, height: 25)
        //imageCell.layer.borderWidth = 1.0
        //imageCell.layer.borderColor = UIColor.black.cgColor
        //imageCell.layer.cornerRadius = 48
        imageCell.contentMode = .scaleAspectFit
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.isHidden = true
        return imageCell
    }()
    
    let shadowButton: UIButton = {
        let shadowButton = UIButton()
        
        shadowButton.addShadow()
        shadowButton.backgroundColor = .white
        //button.frame.size = CGSize(width: 100, height: 100)
        shadowButton.layer.cornerRadius = 25
        shadowButton.translatesAutoresizingMaskIntoConstraints = false
        shadowButton.isHidden = true

        return shadowButton
    }()
    
    let nameUserLabel: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let phoneUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)

        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameUserArray = ["Иван Иванов","Петька Петров","Вудский Дед","Николай Петров","Алексей Казимирчик","Евгений Мамонтов","Сергей Шуруп","Иван Кажуков"]
    
    let phoneUserArray = ["+375447806668","+375447806668","+375447806668","+375447806668","+375447806668","+375447806668","+375447806668","+375447806668"]
    
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
     
          if indexPath.section == 0 {
           shadowButton.isHidden = false
           imageCell.isHidden = false
           nameUserLabel.text = model.nameClients
           phoneUserLabel.text = model.phoneClients
           //guard let data = model.imageClients, let image = UIImage(data: data) else {return}
           //imageCell.image = image
       }
       }
    
    
   
   @objc func switchAction (paramTarget: UISwitch) {
       
   }
   
   
   func setConstraints (){
       
       
       self.addSubview(shadowButton)
       NSLayoutConstraint.activate([
        shadowButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
        shadowButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
        shadowButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
        shadowButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
       ])
       
       self.addSubview(imageCell)
       NSLayoutConstraint.activate([
       
        imageCell.topAnchor.constraint(equalTo: self.topAnchor,constant: 15),
        imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
        //imageCell.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
        //imageCell.trailingAnchor.constraint(equalTo: nameUserLabel.trailingAnchor,constant: -280),
        imageCell.heightAnchor.constraint(equalToConstant: 30),
        imageCell.widthAnchor.constraint(equalToConstant: 30)
       ])
      self.addSubview(nameUserLabel)
       NSLayoutConstraint.activate([
           nameUserLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 13),
           nameUserLabel.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor,constant: 10),
           //nameUserLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
           
           nameUserLabel.heightAnchor.constraint(equalToConstant: 20)
          ])
       
       self.addSubview(phoneUserLabel)
       NSLayoutConstraint.activate([
           
           phoneUserLabel.topAnchor.constraint(equalTo: nameUserLabel.bottomAnchor,constant: 1),
           phoneUserLabel.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor,constant: 10),
           phoneUserLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)
          ])
       
      
       
   }*/
}

