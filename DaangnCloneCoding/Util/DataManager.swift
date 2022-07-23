//
//  DataManager.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/20.
//

import UIKit
import RealmSwift

class DataManager {
    
    static let shared = DataManager()
    
    private let KEY_PERMISSION_JOIN = "KEY_PERMISSION_JOIN"
    
    internal var isPermissionJoin: Bool {
        didSet {
            UserDefaults.standard.set(isPermissionJoin, forKey: KEY_PERMISSION_JOIN)
        }
    }

    private init() {
        UserDefaults.standard.register(defaults: [KEY_PERMISSION_JOIN: false])
        
        isPermissionJoin = UserDefaults.standard.bool(forKey: KEY_PERMISSION_JOIN)
    }
    
    internal func reset() {
        
    }
    //MARK: - DB
    /**
     Realm 연결
     */
    internal func realmConfiguration() -> Realm.Configuration {
        var realmConfig = Realm.Configuration.defaultConfiguration
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory,
                                                        .userDomainMask,
                                                        true)
        
        if let applicationSupportDirectoryPath = paths.first {
            let realmPath = applicationSupportDirectoryPath.appending("/default.realm")
            realmConfig.fileURL = URL(fileURLWithPath: realmPath)
            
            return realmConfig
        }
        return realmConfig
    }
    /**
     Realm 리셋
     */
    internal func resetDB() {
        let realm = try! Realm(configuration: DataManager.shared.realmConfiguration())
        try? realm.write {
            realm.deleteAll()
        }
    }
    
    /**
     특정한 경우 applicationSupport를 생성 하지 않는 문제가 있어 없는 경우 폴더를 수동으로 생성하는 함수
     */
    internal func createApplicationSupport() {
        print(#function)
        let fileManager = FileManager.default
        
        guard let applicationSupportURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return
        }
        
        if !fileManager.fileExists(atPath: applicationSupportURL.path) {
            do {
                try fileManager.createDirectory(atPath: applicationSupportURL.path,
                                                withIntermediateDirectories: false,
                                                attributes: nil)
            } catch {
                print("Error creating log folder in documents dir: \(error)")
            }
        }
    }
    
}
