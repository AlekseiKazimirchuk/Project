//
//  UIView.swift
//  Record
//
//  Created by Алешка on 4.08.22.
//

import UIKit

extension UIView {
    func roundCornersRadii(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {
        let path = UIBezierPath()

        path.move(to: CGPoint(x: topLeft, y: 0))
        path.addLine(to: CGPoint(x: bounds.width - topRight, y: 0))
        path.addArc(withCenter: CGPoint(x: bounds.width - topRight, y: topRight),
                    radius: topRight,
                    startAngle: -CGFloat.pi/2.0,
                    endAngle: 0,
                    clockwise: true)
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.width - bottomRight))
        path.addArc(withCenter: CGPoint(x: bounds.width - bottomRight, y: bounds.height - bottomRight),
                    radius: bottomRight,
                    startAngle: 0,
                    endAngle: CGFloat.pi/2.0,
                    clockwise: true)
        path.addLine(to: CGPoint(x: bottomRight, y: bounds.height))
        path.addArc(withCenter: CGPoint(x: bottomLeft, y: bounds.height - bottomLeft),
                    radius: bottomLeft,
                    startAngle: CGFloat.pi/2.0,
                    endAngle: CGFloat.pi,
                    clockwise: true)
        path.addLine(to: CGPoint(x: 0, y: topLeft))
        path.addArc(withCenter: CGPoint(x: topLeft, y: topLeft),
                    radius: topLeft,
                    startAngle: CGFloat.pi,
                    endAngle: CGFloat.pi/2.0,
                    clockwise: true)
        path.close()

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    
       
        func addShadowView() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
            }
} 

