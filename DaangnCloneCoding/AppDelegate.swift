//
//  AppDelegate.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/03.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootNavigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    //MARK: - General Function
    func switchMain() {
        print("here")
        let vc = RootTabViewController(nibName: "RootTabViewController", bundle: nil)
        
        rootNavigationController = UINavigationController(rootViewController: vc)
        rootNavigationController?.setNavigationBarHidden(true, animated: false)
        
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
    }
}
// MARK: - extension UIViewController
extension UIViewController {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

// MARK: - extension UIWindow
//extension UIWindow {
//    static var keyWindow: UIWindow? {
//        if #available(iOS 13, *) {
//            return UIApplication.shared.windows.first { $0.isKeyWindow }
//        } else {
//            return UIApplication.shared.keyWindow
//        }
//    }
//}
