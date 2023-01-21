//
//  MeetingData.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 13.01.2023.
//

import UIKit
import RealmSwift


class MeetingData: Object {
    
    @Persisted var typeOfMeeting: String = ""
    @Persisted var city: String = ""
    @Persisted var address: String = ""
    @Persisted var name: String = ""
    @Persisted var date: Date?
//    @Persisted var date = NSDate()
    @Persisted var time: Date?
    //    @Persisted var time = NSDate()
    @Persisted var color: String = "1A4766"
    @Persisted var repeatPeriod: Bool = false
    @Persisted var weekRepeat: Int = 1

}
