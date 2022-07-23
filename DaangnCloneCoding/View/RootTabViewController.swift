//
//  RootTabViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/20.
//

import UIKit
import RealmSwift

class RootTabViewController: UIViewController {
    
    let realm = try! Realm(configuration: DataManager.shared.realmConfiguration())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(realm.objects(MyTownDB.self))
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
