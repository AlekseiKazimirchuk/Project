//
//  EntryClientsHeaderFooterView.swift
//  Record
//
//  Created by Алешка on 26.10.22.
//

import UIKit

class EntryClientsHeaderFooterView: UITableViewHeaderFooterView {

    

        let headerLabel = UILabel(text: "")
        
        let headerNameArray = ["","Записи клиента","Профиль клиента","Заметки",""]
        
        override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            
            
           setConstraints()
            
            
            
           
           
           // contentView.clipsToBounds = true
            //accessoryType = .disclosureIndicator
          
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
