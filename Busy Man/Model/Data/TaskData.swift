//
//  TaskData.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 20.01.2023.
//

import UIKit
import RealmSwift

class TaskData: Object {
    @Persisted var titleOfTask: String = ""
    @Persisted var descriptionOfTask: String = ""
    @Persisted var dateOfTask: Date?
    @Persisted var time: Date?
    @Persisted var taskDone: Bool = false
}
