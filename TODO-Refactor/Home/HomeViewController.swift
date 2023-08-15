//
//  HomeViewController.swift
//  TODO-Refactor
//
//  Created by 김동겸 on 2023/08/08.
//

import UIKit
import FSCalendar
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    //날짜 포맷
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy 년 MM 월"
        return formatter
    }()
    
    private var calendarHeaderView = UIView().then {
        $0.backgroundColor = TODOColor.white_FF
    }
    
    private var label_YearMouth = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = TODOColor.black_43
        $0.font = TODOFont.inter_Se(18)
    }
    
    private var btn_AddTodo = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "plus"), for: .normal)
        $0.addTarget(self, action: #selector(pressedBtn_AddTodo(_:)), for: .touchUpInside)

    }
    
    private var btn_ListTodo = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "list"), for: .normal)
        
    }
    
    private var tableView_TodoList = UITableView().then {
        $0.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.identifier)
        $0.separatorStyle = UITableViewCell.SeparatorStyle.none //테이블뷰 셀 선 없애기
    }
    
    private var calendarView = FSCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = TODOColor.white_FF
        
        addSubView()
        setUI()
        setCalendarUI()
        setTableView()
        
    }
    
//MARK: - objc
    @objc func pressedBtn_AddTodo(_ button: UIButton) {
        
        let addVC = AddViewController()
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
//MARK: - Inner Func
    private func addSubView() {
        self.view.addSubview(calendarHeaderView)
        calendarHeaderView.addSubview(label_YearMouth)
        calendarHeaderView.addSubview(btn_AddTodo)
        calendarHeaderView.addSubview(btn_ListTodo)
        
        self.view.addSubview(calendarView)
        
        self.view.addSubview(tableView_TodoList)
    }
    
    private func setUI() {
        
        calendarHeaderView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(36)
            make.top.equalToSuperview().inset(92)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        label_YearMouth.snp.makeConstraints { make in
            make.top.equalTo(calendarHeaderView.snp.top).inset(11)
            make.bottom.equalTo(calendarHeaderView.snp.bottom).inset(4)
            make.leading.equalTo(calendarHeaderView.snp.leading).inset(15)
        }
        
        btn_AddTodo.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(14)
            make.top.equalTo(calendarHeaderView.snp.top).inset(14)
            make.bottom.equalTo(calendarHeaderView.snp.bottom).inset(8)
        }
        
        btn_ListTodo.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(14)
            make.top.equalTo(calendarHeaderView.snp.top).inset(14)
            make.bottom.equalTo(calendarHeaderView.snp.bottom).inset(8)
            make.leading.equalTo(btn_AddTodo.snp.trailing).offset(12)
            make.trailing.equalTo(calendarHeaderView).inset(12)
        }
        
        calendarView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(240)
            make.top.equalTo(calendarHeaderView.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        tableView_TodoList.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().inset(44)
        }
    }
    
}

extension HomeViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    private func setCalendarUI() {
        
        // delegate, dataSource
        calendarView.delegate = self
        calendarView.dataSource = self
        
        calendarView.placeholderType = .none // 전,다음달 날짜 숨기기
        calendarView.appearance.titleDefaultColor = .gray // 평일 날짜 색깔
        calendarView.appearance.titleWeekendColor = .gray // 주말 날짜 색깔
        calendarView.appearance.weekdayTextColor = .gray // 요일 날짜 색깔
        calendarView.calendarHeaderView.isHidden = true // 헤더 숨기기
        calendarView.headerHeight = 0 // 헤더 높이 조정
        
        //이벤트 닷
        calendarView.appearance.eventDefaultColor = TODOColor.blue_3B
        calendarView.appearance.eventSelectionColor = TODOColor.blue_3B
        
        //오늘, 선택한 날짜색
        calendarView.appearance.todayColor = UIColor.init(red: 0.176, green: 0.831, blue: 0.749, alpha: 1)
        calendarView.appearance.selectionColor = TODOColor.blue_3B
        
        //커스텀 헤더 년 월
        label_YearMouth.text = dateFormatter.string(from: calendarView.currentPage)
        
        
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        label_YearMouth.text = self.dateFormatter.string(from: calendarView.currentPage)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setTableView() {
        tableView_TodoList.delegate = self
        tableView_TodoList.dataSource = self
        tableView_TodoList.rowHeight = 67
        
    }
    
    // 몇개의 Cell을 반환할지 Return하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //각Row에서 해당하는 Cell을 Return하는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.identifier, for: indexPath) as! TodoListTableViewCell
        cell.label_TodoTitle.text = "qwe"
        cell.label_TodoContent.text = "asd"
        return cell
    }
    
}
