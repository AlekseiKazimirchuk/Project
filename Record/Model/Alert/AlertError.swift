//
//  AlertError.swift
//  Record
//
//  Created by Алешка on 24.11.22.
//

import UIKit

extension UIViewController {
    func alertOk(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
    }
}
