//
//  NewServiceAddCellTableViewCell.swift
//  Record
//
//  Created by Алешка on 14.11.22.
//

import UIKit

class NewServiceAddCellTableViewCell: UITableViewCell {

    @IBOutlet weak var newServiceTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
