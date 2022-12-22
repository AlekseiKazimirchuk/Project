//
//  NewClientsRecordTableViewCell.swift
//  Record
//
//  Created by Алешка on 15.11.22.
//

import UIKit

class NewClientsRecordTableViewCell: UITableViewCell {
    
    let labelCell: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorLine: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray5
        separator.isHidden = true
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    
    
    // let cellNameArray = ["Клиент","Услуга","Стоймость","Дата","Время"]
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
       // self.selectionStyle = .none
        //self.backgroundColor = .clear
        
        
        // contentView.clipsToBounds = true
        // accessoryType = .disclosureIndicator
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfigure(nameArray: [String],indexPath: IndexPath){
       
           labelCell.text = nameArray[indexPath.section]
           separatorLine.isHidden = false
           
       
      
   }
   
   
   func setConstraints (){
       
      self.addSubview(labelCell)
       NSLayoutConstraint.activate([
           labelCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           labelCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
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
