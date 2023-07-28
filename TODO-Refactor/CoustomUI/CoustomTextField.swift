//
//  CoustomTextField.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/07/27.
//

import Foundation
import UIKit
import Then
import SnapKit

class CoustomTextField: UIView {
    
    static func coustomTextField(_ placeHolder: String) -> UIView {
        
        lazy var view = UIView().then {
            $0.backgroundColor = TODOColor.white_FF
        }
        lazy var textField = UITextField().then {
            $0.font = TODOFont.roboto_Re(20)
            $0.textColor = TODOColor.black_00
            $0.placeholder = placeHolder
            $0.setPlaceholderColor(TODOColor.gray_83)
            
        }
        
        lazy var line = UIView().then {
            $0.backgroundColor = TODOColor.gray_DD
        }
        
        view.addSubview(textField)
        view.addSubview(line)
        
        view.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(29)
        }
        
        textField.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(27)
            make.top.equalTo(view.snp.top).inset(0)
            make.leading.equalTo(view.snp.leading).inset(0)
            make.trailing.equalTo(view.snp.trailing).inset(0)
            
        }
        
        line.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(1)
            make.top.equalTo(textField.snp.bottom).offset(1)
            make.bottom.equalTo(view.snp.bottom).inset(0)
            make.leading.equalTo(view.snp.leading).inset(0)
            make.trailing.equalTo(view.snp.trailing).inset(0)
        }
        
        return view
    }
}

extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
}
