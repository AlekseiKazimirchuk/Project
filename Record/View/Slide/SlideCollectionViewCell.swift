//
//  SlideCollectionViewCell.swift
//  Record
//
//  Created by Алешка on 24.04.22.
//

import UIKit
import GoogleSignIn
import Firebase



class SlideCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var textBtn: UILabel!
    @IBOutlet weak var regBtn: UIButton!
    @IBOutlet weak var authBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    
    static let reuceId = "SlideCollectionViewCell"
    
    var delegate: LoginViewControllerDelegate!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure (slide: Slides) {
        slideImage.image = slide.img
        descriptionText.text = slide.text
        if slide.id == 3{
            regBtn.isHidden = false
            authBtn.isHidden = false
            textBtn.isHidden = false
           
        }
    }
    
    @IBAction func regBinClick(_ sender: Any) {
        delegate.openRegVC()
    }
   
    @IBAction func authBinClick(_ sender: Any) {
        delegate.openAuthVC()
    }
    
    
    
}


