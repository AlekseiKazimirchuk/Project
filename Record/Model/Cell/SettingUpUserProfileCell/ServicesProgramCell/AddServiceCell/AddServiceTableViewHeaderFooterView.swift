//
//  AddServiceTableViewHeaderFooterView.swift
//  Record
//
//  Created by Алешка on 27.09.22.
//

import UIKit

class AddServiceTableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel(text: "")
    
    let headerNameArray = ["","",""]
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
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
