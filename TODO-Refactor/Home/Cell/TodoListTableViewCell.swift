//
//  TodoListTableViewCell.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/08/11.
//

import UIKit
import SnapKit
import Then

class TodoListTableViewCell: UITableViewCell {
    
    static let identifier = "TodoListTableViewCell"
    
    lazy var dot = UIView().then {
        $0.backgroundColor = TODOColor.blue_3B
        $0.layer.cornerRadius = 5
    }
    
    lazy var label_TodoTitle = UILabel().then {
        $0.font = TODOFont.inter_Se(11)
        $0.textColor = TODOColor.gray_A1
    }
    
    lazy var label_TodoContent = UILabel().then {
        $0.font = TODOFont.inter_Se(12)
        $0.textColor = TODOColor.black_00
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        contentView.addSubview(dot)
        contentView.addSubview(label_TodoTitle)
        contentView.addSubview(label_TodoContent)

    }
    
    private func setUI() {
        
        dot.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(12)
            make.top.equalToSuperview().inset(5)
            make.leading.equalTo(5)
            
        }
        
        label_TodoTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalTo(dot.snp.trailing).offset(8)
            make.trailing.equalTo(0)
        }
        
        label_TodoContent.snp_makeConstraints { make in
            make.top.equalTo(label_TodoTitle.snp.bottom).offset(1)
            make.leading.equalTo(label_TodoTitle)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
}
