//
//  RealmManager.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 16.01.2023.
//
import RealmSwift
class RealmManager {
    static let shared = RealmManager()
    
    private init () {}
    
    let localRealm = try! Realm()
    
    func saveMeetingData(data: MeetingData) {
        try! localRealm.write {
            localRealm.add(data)
        }
        print("Realm is located at:", localRealm.configuration.fileURL!)
    }
}
