//
//  CellPlaceAndWorkTableViewCell.swift
//  Record
//
//  Created by Алешка on 8.09.22.
//

import UIKit

class CellPlaceAndWorkTableViewCell: UITableViewCell {

    static let CellPlaceAndWorkTableViewCell = "CellPlaceAndWorkTableViewCell"

    let buttonTransparent: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     let labelCell: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
         label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTimeCell: UILabel = {
       let labelTimeCell = UILabel()
        labelTimeCell.translatesAutoresizingMaskIntoConstraints = false
       return labelTimeCell
   }()
    
    let reapeatSwitch:UISwitch = {
        let reapeatSwitch = UISwitch()
        reapeatSwitch.isOn = true
        reapeatSwitch.isHidden = true
        reapeatSwitch.onTintColor = #colorLiteral(red: 0.5019338131, green: 0.5388896465, blue: 0.6109331846, alpha: 1)
        reapeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return reapeatSwitch
    }()
    
    let cellNameArray = [["Страна"],
                        ["Название организации","Город","Адрес","Комментарий"],
                        ["пн.","вт.","ср.","чт.","пт.","сб.","вс."]]
    
    let cellTimeArray = ["10:00 - 20:00","10:00 - 22:00","10:00 - 22:00","10:00 - 22:00","10:00 - 22:00","10:00 - 22:00","10:00 - 22:00"]
    
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
        
        labelCell.text = cellNameArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 2 {
            buttonTransparent.isHidden = false
    }
        
        if indexPath.section == 0 {
            
    }
        
        if indexPath.section == 2 {
            
            labelTimeCell.text = cellTimeArray[indexPath.row]
    }
        
        if indexPath.section == 2 {
            
            reapeatSwitch.isHidden = false
        }
    }
    
    @objc func switchAction (paramTarget: UISwitch) {
        
    }
    
    func setConstraints (){
        
        self.addSubview(buttonTransparent)
        NSLayoutConstraint.activate([
            buttonTransparent.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            buttonTransparent.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0),
            buttonTransparent.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0),
            buttonTransparent.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0)])
        
        self.addSubview(labelCell)
        NSLayoutConstraint.activate([
            labelCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15)
           ])
        
        self.addSubview(labelTimeCell)
        NSLayoutConstraint.activate([
            labelTimeCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelTimeCell.leadingAnchor.constraint(equalTo: labelCell.leadingAnchor,constant: 70)])
        
        self.contentView.addSubview(reapeatSwitch)
        NSLayoutConstraint.activate([
            reapeatSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            reapeatSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20)
           ])
    }
}
