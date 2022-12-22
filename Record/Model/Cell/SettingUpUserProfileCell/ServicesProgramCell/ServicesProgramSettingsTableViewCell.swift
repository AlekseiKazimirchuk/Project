//
//  ServicesProgramSettingsTableViewCell.swift
//  Record
//
//  Created by Алешка on 22.09.22.
//

import UIKit


class ServicesProgramSettingsTableViewCell: UITableViewCell {
    
    static let ServicesProgramSettingsTableViewCell = "ServicesProgramSettingsTableViewCell"
    
     let labelOneCell: UILabel = {
        let label = UILabel()
         
        label.numberOfLines = 1
         label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTwoCell: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        //labelTimeCell.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    let labelThreeCell: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        //labelTimeCell.numberOfLines = 1
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
    
    /*let addServiceLabel: UILabel = {
       let label = UILabel()
        label.text = "Добавить улсугу"
        //label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        //labelTimeCell.numberOfLines = 1
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()*/
    
    let cellOneArray = ["Стрижка","Стрижка+борода","Стрижка+тоннировка","Стрижка машинкой","Стрижка бороды","Стрижка машинкой+борода","Добавить усугу"]
    
    let cellTwoArray = ["65Br","95Br","95Br","45Br","45Br","75Br"]
    
    let cellThreeArray = ["Комментарий","Комментарий","Комментарий","Комментарий","Комментарий","Комментарий"]
    let addServiceArray = ["Добавить услугу"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       setConstraints()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: ServicePriceCommentModel){
    
            labelOneCell.text = model.haircat
            labelTwoCell.text = model.priceService
            labelThreeCell.text = model.comment
            separatorLine.isHidden = false
        
    }
    
    func setConstraints (){
        
        self.addSubview(labelOneCell)
        NSLayoutConstraint.activate([
            //labelOneCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelOneCell.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            labelOneCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25)
           ])
        
        self.addSubview(labelTwoCell)
        NSLayoutConstraint.activate([
            labelTwoCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelTwoCell.leadingAnchor.constraint(equalTo: labelOneCell.leadingAnchor,constant: 0)])
        
        self.contentView.addSubview(labelThreeCell)
        NSLayoutConstraint.activate([
            labelThreeCell.centerYAnchor.constraint(equalTo: labelTwoCell.centerYAnchor,constant: 13),
            labelThreeCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25)
           ])
        
        self.addSubview(separatorLine)
        NSLayoutConstraint.activate([
         separatorLine.widthAnchor.constraint(equalToConstant: 150),
         separatorLine.heightAnchor.constraint(equalToConstant: 2),
     
         separatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
         separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 1),
        
         separatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 1)
         
        ])
        
        /*self.addSubview(addServiceLabel)
        
       NSLayoutConstraint.activate([
        
        addServiceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        addServiceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 115)])*/
    }
}
