//
//  PhotoCameraAlert.swift
//  Record
//
//  Created by Алешка on 12.10.22.
//

import UIKit

extension UIViewController {

func alertPhotoCamera(completionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
    
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    let camera = UIAlertAction(title: "Камера", style: .default) { _ in
        let camera = UIImagePickerController.SourceType.camera
        completionHandler(camera)
}
    let photoLibrary = UIAlertAction(title: "Фото галерея", style: .default) { _ in
        let photoLibrary = UIImagePickerController.SourceType.photoLibrary
        completionHandler(photoLibrary)
    }
    
    let cancel = UIAlertAction(title: "Отмена", style: .cancel)
    
   // alertController.negativeWidthConstraint()
    
    alertController.addAction(camera)
    alertController.addAction(photoLibrary)
    alertController.addAction(cancel)
    
    present(alertController, animated: true)
    
}
}
