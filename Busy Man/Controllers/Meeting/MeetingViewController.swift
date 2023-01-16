//
//  MeetingViewController.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 09.01.2023.
//

import UIKit
import FSCalendar
import SnapKit

class MeetingViewController: UIViewController {
    // Height of Calendar
    var calendarHeight: NSLayoutConstraint!
    
    
    // MARK: - creating of calendar with FSCalendar
    let calendar: FSCalendar = {
        let calendar = FSCalendar()
        return calendar
    }()
    
    //MARK: - creating button
    
    let calendarButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Calendar", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont(name: "American Typewriter Bold", size: 14)
        return button
    }()
    
    @objc func tappedCalendarButton() {
        
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            calendarButton.setTitle("Hide Calendar", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            calendarButton.setTitle("Open Calendar", for: .normal)
        }
    }
    
    // MARK: - Swipe method for calendar
    func swipeCalendar() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeActionCalendar))
        swipeUp.direction = .up
        calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeActionCalendar))
        swipeDown.direction = .down
        calendar.addGestureRecognizer(swipeDown)
    }
    @objc func swipeActionCalendar(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .up {
            tappedCalendarButton()
        } else if gesture.direction == .down {
            tappedCalendarButton()
        }
        
    }

    
//MARK: - Table view
    
    let tableView: UITableView = {
        let table = UITableView()
        table.bounces = false
        table.separatorColor = .black
        table.tintColor = .red
        return table
    }()
    
    let idMeetingCell = "idMeetingCell"
    
    @objc func addButton() {
        navigationController?.pushViewController(AddMeetingController(), animated: true)
    }
    
    
    
//MARK: - ViewDidLoad and constraints
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Meetings"
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = .week
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MeetingCell.self, forCellReuseIdentifier: idMeetingCell)
        navigationController?.tabBarController?.tabBar.scrollEdgeAppearance = navigationController?.tabBarController?.tabBar.standardAppearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        
        
        
        calendarButton.addTarget(self, action: #selector(tappedCalendarButton), for: .touchUpInside)
        swipeCalendar()
        
        
        view.addSubview(calendar)
        calendarHeight = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        calendar.addConstraint(calendarHeight)
        calendar.snp.makeConstraints { make in
            make.top.equalTo(90)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
        }
        
        view.addSubview(calendarButton)
        calendarButton.snp.makeConstraints { make in
            make.centerX.equalTo(calendar).offset(-140)
            make.bottom.equalTo(calendar).offset(25)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(calendarButton).offset(30)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalTo(calendarButton).offset(550)
        }
    }
    
}

// MARK: - FSCalendarDelegate, FSCalendarDataSource
extension MeetingViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeight.constant = bounds.height
        view.layoutIfNeeded()
    }
}

// MARK: - TableViewDelegate, TableView DataSource

extension MeetingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idMeetingCell, for: indexPath) as! MeetingCell
        
        switch indexPath.row {
        case 0: cell.backgroundColor = .red
        case 1: cell.backgroundColor = .cyan
        default: cell.backgroundColor = .green
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
