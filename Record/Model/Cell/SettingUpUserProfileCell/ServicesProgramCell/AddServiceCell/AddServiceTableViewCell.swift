//
//  AddServiceTableViewCell.swift
//  Record
//
//  Created by Алешка on 27.09.22.
//

import UIKit

class AddServiceTableViewCell: UITableViewCell {

    let labelService: UILabel = {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       setConstraints()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfigure(nameArray: [String],indexPath: IndexPath){
        
        labelService.text = nameArray[indexPath.row] //section
        separatorLine.isHidden = false
        
    }
    
   func setConstraints (){
        
        self.addSubview(labelService)
        NSLayoutConstraint.activate([
            labelService.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelService.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelService.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
           ])
       
       self.addSubview(separatorLine)
       NSLayoutConstraint.activate([
        separatorLine.widthAnchor.constraint(equalToConstant: 150),
        separatorLine.heightAnchor.constraint(equalToConstant: 2),
    
        separatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 1),
       
        separatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 1)
        
       ])
       
       }
}
