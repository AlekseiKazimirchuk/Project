//
//  AddNewClientsRecordTableViewCell.swift
//  Record
//
//  Created by Алешка on 26.11.22.
//

import UIKit

class AddNewClientsRecordSuperTableViewCell: UITableViewCell {

    let imageCell: UIImageView = {
        let imageCell = UIImageView(/*image: UIImage(named: "allClients")*/)
        //imageCell.image = UIImage(systemName: "addUser")
        
        //imageCell.frame.size = CGSize(width: 50, height: 50)
        
        imageCell.layer.cornerRadius = 30
        imageCell.clipsToBounds = true
        imageCell.layer.masksToBounds = true
        imageCell.contentMode = .scaleAspectFit
        imageCell.translatesAutoresizingMaskIntoConstraints = false
       // imageCell.isHidden = true
        return imageCell
    }()
    
    let separatorLine: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray5
        separator.isHidden = true
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    let addPhotoClients: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Добавить фото клиента"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    
    let nameUserLabel: UILabel = {
       let label = UILabel()
        
       // label.text = "Имя"
       label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.isHidden = true
       return label
   }()
    
   
    
   // let nameArray = ["Имя","Дата рождения","Номер телефона","Istagram","Facebook"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
      setConstraints()
       
       self.selectionStyle = .none
       self.backgroundColor = .clear
       
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
    func cellConfigure(nameArray: [String],indexPath: IndexPath, image: UIImage?){
        
       if image == nil {
           //indexPath.section == 0 ? imageCell.isHidden = false : nil
           indexPath.section == 0 ? imageCell.image = UIImage(named: "allClients") : nil
           
            indexPath.section == 0 ? addPhotoClients.isHidden = false : nil
           
           
        } else {
            indexPath.section == 0 ? imageCell.image = image : nil
            
            imageCell.contentMode = .scaleAspectFill
            
            indexPath.section == 0 ? addPhotoClients.isHidden = false : nil
            
            
        }
        
         nameUserLabel.text = nameArray[indexPath.section]
         separatorLine.isHidden = false
        
       }
   
   func setConstraints (){
       
       self.addSubview(imageCell)
       NSLayoutConstraint.activate([
       
        imageCell.heightAnchor.constraint(equalToConstant: 60),
        imageCell.widthAnchor.constraint(equalToConstant: 60),
        
        imageCell.topAnchor.constraint(equalTo: self.topAnchor,constant: 3),
        imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
        //imageCell.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -25)

       ])
       
       self.addSubview(addPhotoClients)
       NSLayoutConstraint.activate([
        addPhotoClients.topAnchor.constraint(equalTo: self.topAnchor,constant: 20),
        addPhotoClients.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor,constant: 30)
       ])
        
       self.addSubview(nameUserLabel)
       NSLayoutConstraint.activate([
        nameUserLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        nameUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
       ])
       
       self.addSubview(separatorLine)
       NSLayoutConstraint.activate([
        separatorLine.widthAnchor.constraint(equalToConstant: 50),
        separatorLine.heightAnchor.constraint(equalToConstant: 2),
    
        separatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 1),
       
        separatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 70)
        
       ])
       
     
   }
   
}
