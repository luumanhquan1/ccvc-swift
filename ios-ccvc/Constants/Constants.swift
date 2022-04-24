//
//  Constants.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 13/03/2022.
//

import UIKit

class Constants{
    static let defaultImage = "defaultImage".image
    struct font{
        enum Roboto : String{
            case regular = "Roboto-Regular"
            case medium = "Roboto-Medium"
            case bold = "Roboto-Bold"
        }
        static func roboto(type: Roboto = .regular, size: CGFloat = 14.0) -> UIFont {
            return UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size + 1)
        }
    }
}

