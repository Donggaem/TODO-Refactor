//
//  AddViewController.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/08/15.
//

import UIKit
import SnapKit
import Then

class AddViewController: UIViewController {

    private var textField_Title = CoustomTextField.coustomTextField_Title("제목을 입력해주세요")
    private var textField_Date = CoustomTextField.coustomTextField_Date("날짜를 입력해주세요")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = TODOColor.white_FF

        addSubView()
        setUI()
    }
    
//MARK: - Inner Func
    private func addSubView() {
        self.view.addSubview(textField_Title)
        self.view.addSubview(textField_Date)
    }
    
    private func setUI() {
        
        textField_Title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(104)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)

        }
        
        textField_Date.snp.makeConstraints { make in
            make.top.equalTo(textField_Title.snp.bottom).offset(60)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)

        }
    }
    
}
