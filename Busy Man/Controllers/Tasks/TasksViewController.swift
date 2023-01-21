//
//  TasksViewController.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 09.01.2023.
//

import UIKit
import FSCalendar
import RealmSwift

class TasksViewController: UIViewController {
    // Height of Calendar
    var calendarHeight: NSLayoutConstraint!
    
    let realm = try! Realm()
    var taskArray: Results<TaskData>!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
        
        let idTaskCell = "idTaskCell"

    @objc func goToAddTaskController() {
        navigationController?.pushViewController(AddTaskController(), animated: true)
    }
    
    private func setTask(date: Date) {
        let dateStart = date
        let dateEnd: Date = {
            let components = DateComponents(day: 1, second: -1)
            return Calendar.current.date(byAdding: components,to: dateStart)!
        }()
        taskArray = realm.objects(TaskData.self).filter("dateOfTask BETWEEN %@", [dateStart,dateEnd])
        tableView.reloadData()
    }
//MARK: - ViewDidLoad and constraints
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tasks"
        calendar.tintColor = .black
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = .week
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TasksCell.self, forCellReuseIdentifier: idTaskCell)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddTaskController))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        taskArray = realm.objects(TaskData.self)
        setTask(date: calendar.today!)
        
        calendarButton.addTarget(self, action: #selector(tappedCalendarButton), for: .touchUpInside)
        swipeCalendar()
        
        
        
        view.addSubview(calendar)
        calendarHeight = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
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
            make.centerX.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalTo(calendarButton).offset(590)
        }
    }
}

// MARK: - FSCalendarDelegate, FSCalendarDataSource
extension TasksViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeight.constant = bounds.height
        view.layoutIfNeeded()
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        setTask(date: date)
    }

}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTaskCell, for: indexPath) as! TasksCell
        let data = taskArray[indexPath.row]
        cell.cellTaskDelegate = self
        cell.index = indexPath
        cell.configure(data: data)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let rowOfTask = taskArray[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            RealmManager.shared.detele(data: rowOfTask)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

extension TasksViewController: PressButton {
    func readyButton(index: IndexPath) {
        let data = taskArray[index.row]
        RealmManager.shared.update(data: data, bool: !data.taskDone)
        tableView.reloadData()
        print("TAP")
    }
}


