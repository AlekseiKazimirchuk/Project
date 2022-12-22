//
//  CopyToPhoneTableViewCell.swift
//  Record
//
//  Created by Алешка on 4.10.22.
//

import UIKit

class CopyToPhoneTableViewCell: UITableViewCell {

    let labelCell: UILabel = {
        let label = UILabel()
         
        label.numberOfLines = 1
         label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelCellTwo: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
       label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let reapeatSwitch:UISwitch = {
        let reapeatSwitch = UISwitch()
        reapeatSwitch.isOn = true
        reapeatSwitch.isHidden = true
        reapeatSwitch.onTintColor = #colorLiteral(red: 0.5019338131, green: 0.5388896465, blue: 0.6109331846, alpha: 1)
        reapeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return reapeatSwitch
    }()
    
    let cellNameArray = ["Включив автоматическое копирование в телефон, новые добавленные клиенты, будут сохранятся в приложении и в адресной книге телефона.","Копировать в телефонную книгу"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        reapeatSwitch.addTarget(self, action: #selector(switchAction(paramTarget:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfigure(indexPath: IndexPath){
        switch indexPath {
        case [0,0]:
            labelCellTwo.text = cellNameArray[indexPath.row]
            
        case [0,1]:
            labelCell.text = cellNameArray[indexPath.row]
            reapeatSwitch.isHidden = false
        default:
            print ("Error")
        }
      
    }
    
    @objc func switchAction (paramTarget: UISwitch) {
        
    }
    
    func setConstraints (){
        
        self.addSubview(labelCellTwo)
        NSLayoutConstraint.activate([
            //labelCellTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelCellTwo.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            labelCellTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            labelCellTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 5),
            labelCellTwo.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 5)
           ])
        
        self.addSubview(labelCell)
        NSLayoutConstraint.activate([
            labelCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
           ])
        
        self.contentView.addSubview(reapeatSwitch)
        NSLayoutConstraint.activate([
            reapeatSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            reapeatSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20)
           ])
        }
}
