//
//  KogdaYzheVoidTableViewCell.swift
//  Record
//
//  Created by Алешка on 4.12.22.
//

import UIKit

class ClientMainViewTableViewCell: UITableViewCell {
    
    let imageUserCell: UIImageView = {
        let imageCell = UIImageView(image: UIImage(named: "allClients"))
        //imageCell.clipsToBounds = true
        //imageCell.layer.masksToBounds = true
        //imageCell.frame.size = CGSize(width: 10, height: 10)
        //imageCell.layer.borderWidth = 5.0
        //imageCell.layer.borderColor = UIColor.black.cgColor
        imageCell.layer.cornerRadius = 20
        imageCell.contentMode = .scaleAspectFit
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        //imageCell.isHidden = true
        return imageCell
    }()

    let labelCell: UILabel = {
       let label = UILabel()
        
       label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let labelCellTwo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
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
   
   func configure(model: ContactMode){
     
       labelCell.text = model.nameClients
       labelCellTwo.text = model.phoneClients
       guard let data = model.imageClients, let image = UIImage (data: data) else {return}
       imageUserCell.image = image
       
   }
   
   func setConstraints (){
       
       self.addSubview(imageUserCell)
        NSLayoutConstraint.activate([
            imageUserCell.widthAnchor.constraint(equalToConstant: 35),
            imageUserCell.heightAnchor.constraint(equalToConstant: 35),
            
            imageUserCell.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            imageUserCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            imageUserCell.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
           ])
       
      self.addSubview(labelCell)
       NSLayoutConstraint.activate([
           labelCell.widthAnchor.constraint(equalToConstant: 50),
           labelCell.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
           labelCell.leadingAnchor.constraint(equalTo: imageUserCell.trailingAnchor,constant: 15),
           labelCell.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15)
           //labelCell.bottomAnchor.constraint(equalTo: self.bottomAnchor)
          ])
       
       self.addSubview(labelCellTwo)
       NSLayoutConstraint.activate([
           
           labelCellTwo.widthAnchor.constraint(equalToConstant: 50),
           labelCellTwo.leadingAnchor.constraint(equalTo: imageUserCell.trailingAnchor,constant: 15),
           labelCellTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
           labelCellTwo.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)
        
          ])
       }
}
