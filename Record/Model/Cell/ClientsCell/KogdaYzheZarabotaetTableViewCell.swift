//
//  KogdaYzheZarabotaetTableViewCell.swift
//  Record
//
//  Created by Алешка on 6.12.22.
//

import UIKit

class KogdaYzheZarabotaetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageUser: UIImageView!
    
    
    @IBOutlet weak var nameLabelCell: UILabel!
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
   
       
       self.selectionStyle = .none
       self.backgroundColor = .clear
       

   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
    func cellConfigure(nameArray: [String],indexPath: IndexPath, image: UIImage?){
        
       
        
        
        if image == nil {
            indexPath.section == 0 ? imageUser.image = UIImage(systemName: "2portrait") : nil
            
            
        } else {
            indexPath.section == 0 ? imageUser.image = image : nil
            imageUser.contentMode = .scaleAspectFit
            
            
        }
        
        indexPath.section == 1 ? nameLabelCell.text = nameArray[indexPath.row] : nil
      
       
   }
   
   
   
   
 
}
