//
//  ViewController.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 09.01.2023.
//

import UIKit
import SnapKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpTabBar()
        
    }
    func setUpTabBar() {
        
        let meeting = createTabBar(vc: MeetingViewController(), itemName: "Meetings", itemImage: "person.badge.clock.fill")
        let tasks = createTabBar(vc: TasksViewController(), itemName: "Tasks", itemImage: "table")
        let calls = createTabBar(vc: CallsViewController(), itemName: "Calls", itemImage: "phone.fill")
        
        viewControllers = [meeting, tasks, calls]
        
    }

    func createTabBar(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController{
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let controller = UINavigationController(rootViewController: vc)
        controller.tabBarItem = item
        return controller
        
    }

}

