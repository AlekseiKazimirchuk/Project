//
//  Model.swift
//  Record
//
//  Created by Алешка on 26.04.22.
//

import UIKit

enum AuthResponce {
    case success, noVerify, error
}

struct Slides {
    var id: Int
    var text: String
    var img: UIImage
}

struct LoginField  {
    var email: String
    var password: String
}

struct ResponceCode{
    var code: Int
}
