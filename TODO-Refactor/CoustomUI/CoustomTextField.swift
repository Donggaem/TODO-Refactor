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
            make.height.equalTo(19)
            make.top.equalTo(view.snp.top).inset(0)
            make.leading.equalTo(view.snp.leading).inset(0)
            make.trailing.equalTo(view.snp.trailing).inset(0)
            
        }
        
        line.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(1)
            make.top.equalTo(textField.snp.bottom).offset(8)
            make.bottom.equalTo(view.snp.bottom).inset(0)
            make.leading.equalTo(view.snp.leading).inset(0)
            make.trailing.equalTo(view.snp.trailing).inset(0)
        }
        
        return view
    }
    
    //중복확인이 있는 textfield
    static func coustomTextField_checkbtn(_ placeHolder: String) -> UIView {
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
        
        lazy var checkBtn = UIButton(type: .custom).then {
            $0.backgroundColor = TODOColor.blue_3B
            $0.setTitle("중복확인", for: .normal)
            $0.titleLabel?.font = TODOFont.roboto_Re(12)
            $0.setTitleColor(TODOColor.white_FF, for: .normal)
            $0.layer.cornerRadius = 5
            
        }
        
        view.addSubview(textField)
        view.addSubview(checkBtn)
        view.addSubview(line)
        
        view.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(29)
        }
        
        textField.snp.makeConstraints { make in
            make.width.equalTo(246)
            make.height.equalTo(19)
            make.top.equalTo(view.snp.top).inset(0)
            make.leading.equalTo(view.snp.leading).inset(0)
        }
        
        checkBtn.snp.makeConstraints { make in
            make.width.equalTo(79)
            make.height.equalTo(19)
            make.centerX.equalTo(textField)
            make.leading.equalTo(textField.snp.trailing).offset(-1)
            make.trailing.equalTo(view.snp.trailing).inset(0)
        }
        
        line.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(1)
            make.top.equalTo(textField.snp.bottom).offset(8)
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
