//
//  CoustomColor.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/07/27.
//

import Foundation
import UIKit

class TODOColor: UIColor {
    
    static let black_00 = UIColor(hexCode: "#000000")
    static let black_43 = UIColor(hexCode: "#434343")
    static let white_FF = UIColor(hexCode: "#FFFFFF")
    static let gray_D1 = UIColor(hexCode: "#D1D1D1")
    static let gray_DD = UIColor(hexCode: "#DDDDDD")
    static let gray_A1 = UIColor(hexCode: "#A1A1AA")
    static let blue_3B = UIColor(hexCode: "#3B82F6")
    
}

// 헥스코드 색상변경
extension UIColor {

    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
