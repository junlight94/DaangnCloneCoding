//
//  SplashViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/12.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        print("Splash 분기")
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            timer.invalidate()
            DispatchQueue.main.async {
                self.checkJoin()
            }
        }
    }
    // MARK: - General function
    func checkJoin() {
        if DataManager.shared.isPermissionJoin == true {
            self.appDelegate.switchMain()
        } else {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "intro")
            viewController.modalPresentationStyle = .fullScreen
            
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
    // MARK: - IBAction function

    // MARK: - Selector function

    // MARK: - Extension
}

