//
//  LoginViewController.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/07/27.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    private var label_TODO = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = TODOColor.black_00
        $0.font = TODOFont.roboto_Me(60)
        $0.text = "TODO"
    }
    
    private var idTextField = CoustomTextField.coustomTextField("ID")
    private var pwTextField = CoustomTextField.coustomTextField("PW")
    
    private var btn_Sigeup = UIButton(type: .custom).then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = TODOFont.roboto_Re(10)
        $0.setTitleColor(TODOColor.gray_D1, for: .normal)
        
    }
    
    private var btn_FindID = UIButton(type: .custom).then {
        $0.setTitle("아이디/비밀번호 찾기", for: .normal)
        $0.titleLabel?.font = TODOFont.roboto_Re(10)
        $0.setTitleColor(TODOColor.gray_D1, for: .normal)
        
    }
    
    private var btn_Login = CoustomButton.coustomBtn_main("로그인")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = TODOColor.white_FF
        setUI()
    }
    
    private func setUI() {
        self.view.addSubview(label_TODO)
        
        self.view.addSubview(idTextField)
        self.view.addSubview(pwTextField)

        self.view.addSubview(btn_Sigeup)
        self.view.addSubview(btn_FindID)
        
        self.view.addSubview(btn_Login)
        
        label_TODO.snp.makeConstraints { make in
            make.top.equalTo(self.view).inset(150)
            make.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(label_TODO.snp.bottom).offset(363)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        btn_Sigeup.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(12)
            make.top.equalTo(pwTextField.snp.bottom).offset(10)
            make.trailing.equalTo(btn_FindID.snp.leading).offset(-12)
            
        }
        
        btn_FindID.snp.makeConstraints { make in
            make.width.equalTo(95)
            make.height.equalTo(12)
            make.top.equalTo(pwTextField.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(32)
            
        }
        
        btn_Login.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(48)
            make.top.equalTo(btn_Sigeup).offset(42)
            make.bottom.equalToSuperview().inset(75)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
    }
}
