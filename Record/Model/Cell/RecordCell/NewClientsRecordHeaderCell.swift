//
//  NewClientsRecordHeaderCell.swift
//  Record
//
//  Created by Алешка on 8.12.22.
//

import UIKit

class NewClientsRecordHeaderCell: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel(text: "")
    
    let headerNameArray = ["Клиент","Услуги","Стоймость","Дата","Начало услуги","Окончание улсуги"]
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
       setConstraints()
        //self.contentView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func headerConfigure (section:Int){
        headerLabel.text = headerNameArray[section]
        headerLabel.textColor = .gray
    }
    
    func setConstraints() {
       
        self.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
