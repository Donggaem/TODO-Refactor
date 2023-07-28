//
//  CoustomFont.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/07/27.
//

import Foundation
import UIKit

class TODOFont: UIFont {
    
    static func roboto_Me (_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size) ?? systemFont(ofSize: size)
    }
    
    static func roboto_Bl (_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: size) ?? systemFont(ofSize: size)
    }
    
    static func roboto_Re (_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size) ?? systemFont(ofSize: size)
    }
    
    static func inter_Se (_ size: CGFloat) -> UIFont {
        return UIFont(name: "Inter-SemiBold", size: size) ?? systemFont(ofSize: size)
    }
    
    static func inter_Bl (_ size: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Black", size: size) ?? systemFont(ofSize: size)
    }
}
