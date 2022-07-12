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
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            timer.invalidate()
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PlaceSettingViewController")
            viewController.modalPresentationStyle = .fullScreen
            
            UIApplication.shared.keyWindow?.rootViewController = viewController
            
            
        }
        
    }
    // MARK: - General function

    // MARK: - IBAction function

    // MARK: - Selector function

    // MARK: - Extension
}

