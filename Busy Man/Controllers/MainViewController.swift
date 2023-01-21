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
        self.tabBar.tintColor = .black
        setUpTabBar()
        
    }
    func setUpTabBar() {
        
        let meeting = createTabBar(vc: MeetingViewController(), itemName: "Meetings", itemImage: "person.badge.clock.fill")
        let tasks = createTabBar(vc: TasksViewController(), itemName: "Tasks", itemImage: "table")
//        let calls = createTabBar(vc: CallsViewController(), itemName: "Calls", itemImage: "phone.fill")
        
        viewControllers = [meeting, tasks/*, calls*/]
        
    }

    func createTabBar(vc: UIViewController, itemName: String, itemImage: String) -> UIViewController{
        
        let controller = UINavigationController(rootViewController: vc)
        controller.tabBarItem.title = itemName
        controller.tabBarItem.image = UIImage(systemName: itemImage)
        controller.navigationItem.title = itemName
        controller.navigationBar.scrollEdgeAppearance = controller.navigationBar.standardAppearance
        return controller
    }

}

