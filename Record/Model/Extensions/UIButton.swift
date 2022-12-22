//
//  UIButton.swift
//  Record
//
//  Created by Алешка on 4.08.22.
//

import UIKit
extension UIButton {
   
    func addShadow() {
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowRadius = 4
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    
func addShadow2() {
layer.shadowColor = UIColor.darkGray.cgColor
layer.shadowRadius = 3
layer.shadowOpacity = 0.5
layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    



    func alignVertical(spacing: CGFloat, lang: String) {
            guard let imageSize = self.imageView?.image?.size,
                let text = self.titleLabel?.text,
                let font = self.titleLabel?.font
            else { return }

            let labelString = NSString(string: text)
            let titleSize = labelString.size(
                withAttributes: [NSAttributedString.Key.font: font]
            )

            var titleLeftInset: CGFloat = -imageSize.width
            var titleRigtInset: CGFloat = 0.0

            var imageLeftInset: CGFloat = 0.0
            var imageRightInset: CGFloat = -titleSize.width

            if Locale.current.languageCode! != "en" { // If not Left to Right language
                titleLeftInset = 0.0
                titleRigtInset = -imageSize.width

                imageLeftInset = -titleSize.width
                imageRightInset = 0.0
            }

            self.titleEdgeInsets = UIEdgeInsets(
                top: 0.0,
                left: titleLeftInset,
                bottom: -(imageSize.height + spacing),
                right: titleRigtInset
            )
            self.imageEdgeInsets = UIEdgeInsets(
                top: -(titleSize.height + spacing),
                left: imageLeftInset,
                bottom: 0.0,
                right: imageRightInset
            )
            let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
            self.contentEdgeInsets = UIEdgeInsets(
                top: edgeOffset,
                left: 0.0,
                bottom: edgeOffset,
                right: 0.0
            )
        }
    }

