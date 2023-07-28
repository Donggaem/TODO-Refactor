//
//  CoustomButton.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/07/28.
//

import Foundation
import UIKit
import SnapKit
import Then

class CoustomButton: UIButton {
    
    static func coustomBtn_main(_ title: String) -> UIButton {
        
        lazy var button = UIButton(type: .custom).then {
            $0.backgroundColor = TODOColor.blue_3B
            $0.setTitle(title, for: .normal)
            $0.titleLabel?.font = TODOFont.roboto_Me(20)
            $0.setTitleColor(TODOColor.white_FF, for: .normal)
            $0.layer.cornerRadius = 10
            
            $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor // 색깔
            $0.layer.masksToBounds = false
            $0.layer.shadowOffset = CGSize(width:4, height: 4) // 위치조정
            $0.layer.shadowRadius = 10 // 반경
            $0.layer.shadowOpacity = 1 // alpha값
            
//            $0.layer.borderWidth = 1
//            $0.layer.borderColor = UIColor(red: 0.483, green: 0.835, blue: 0.883, alpha: 1).cgColor
            
        }
        
        return button
    }
}
