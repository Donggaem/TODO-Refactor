//
//  SignUPViewController.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/07/29.
//

import UIKit
import SnapKit
import Then

class SignupViewController: UIViewController {
    
    private var label_TODO = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = TODOColor.black_00
        $0.font = TODOFont.roboto_Me(60)
        $0.text = "TODO"
    }
    
    private var idTextField = CoustomTextField.coustomTextField_checkbtn("아이디를 입력하세요")
    private var nickNameTextField = CoustomTextField.coustomTextField_checkbtn("닉네임을 입력하세요")
    private var pwTextField = CoustomTextField.coustomTextField("비밀번호를 입력하세요")
    private var pwCheckTextField = CoustomTextField.coustomTextField("비밀번호를 확인해주세요")
    
    private var btn_Signup = CoustomButton.coustomBtn_main("회원가입").then {
        $0.addTarget(self, action: #selector(pressedBtn_Signup(_:)), for: .touchUpInside)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = TODOColor.white_FF
        addSubView()
        setUI()
        
    }
    
//MARK: - objc
    @objc func pressedBtn_Signup(_ button: UIButton) {
        
        let homeVC = HomeViewController()
        self.navigationController?.popViewController(animated: true)
        
    }
    
//MARK: - Inner Func
    private func addSubView() {
        
        self.view.addSubview(label_TODO)
        
        self.view.addSubview(idTextField)
        self.view.addSubview(nickNameTextField)
        self.view.addSubview(pwTextField)
        self.view.addSubview(pwCheckTextField)
        
        self.view.addSubview(btn_Signup)
        
    }
    
    private func setUI() {
        
        label_TODO.snp.makeConstraints { make in
            make.top.equalTo(self.view).inset(150)
            make.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(label_TODO.snp.bottom).offset(203)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        nickNameTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(nickNameTextField.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        pwCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        
        btn_Signup.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(48)
            make.top.equalTo(pwCheckTextField.snp.bottom).offset(94)
            make.bottom.equalToSuperview().inset(75)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
}
