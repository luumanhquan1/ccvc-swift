//
//  DoubleExtension.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 09/04/2022.
//

import Foundation
extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
           let multiplier = pow(10, Double(fractionDigits))
           return Darwin.round(self * multiplier) / multiplier
       }
}
