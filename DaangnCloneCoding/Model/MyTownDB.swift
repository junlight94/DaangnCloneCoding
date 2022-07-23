//
//  MyTownDB.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/23.
//

import UIKit
import RealmSwift

class MyTownDB: Object {
    @objc dynamic var id = 0
    var myTown: List<String> = List<String>()
    var myTownArr: [String] {
        get {
            return myTown.map{$0}
        }
        set {
            myTown.removeAll()
            myTown.append(objectsIn: newValue)
        }
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func incrementID() -> Int {
        let realm = try! Realm(configuration: DataManager.shared.realmConfiguration())
        return (realm.objects(MyTownDB.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
