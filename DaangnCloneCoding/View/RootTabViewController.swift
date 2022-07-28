//
//  RootTabViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/20.
//

import UIKit
import RealmSwift

class RootTabViewController: UIViewController {
    
    @IBOutlet weak var viewContainer: UIView!
    
    let realm = try! Realm(configuration: DataManager.shared.realmConfiguration())
    
    var selectedTabIndex = 0
    
    lazy var viewControllers = [
        MainViewController(nibName: "MainViewController", bundle: nil),
        LifeViewController(nibName: "LifeViewController", bundle: nil),
        AroundViewController(nibName: "AroundViewController", bundle: nil),
        ChatViewController(nibName: "ChatViewController", bundle: nil),
        MyPageViewController(nibName: "MyPageViewController", bundle: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        print(realm.objects(MyTownDB.self))
    }
    
    func setupView() {
        let vc = viewControllers[0]
        
        addChild(vc)
        
        viewContainer.addSubview(vc.view)
        
        vc.view.snp.makeConstraints { make in
            make.centerX.centerY.width.height.equalToSuperview()
        }
        
        vc.didMove(toParent: self)
    }
    
    func moveView(view: Int){
        if let sub = viewContainer.subviews.first {
            sub.removeFromSuperview()
        }
        
        let vc = viewControllers[view]
        
        addChild(vc)
        
        viewContainer.addSubview(vc.view)
        
        vc.view.snp.makeConstraints { make in
            make.centerX.centerY.width.height.equalToSuperview()
        }
        
        vc.didMove(toParent: self)
    }
    
    @IBAction func btnHomePressed(_ sender: Any) {
        moveView(view: 0)

    }
    
    @IBAction func btnLifePressed(_ sender: Any) {
        moveView(view: 1)
    }
    
    @IBAction func btnLocationPressed(_ sender: Any) {
        moveView(view: 2)

    }
    
    @IBAction func btnChatPressed(_ sender: Any) {
        moveView(view: 3)

    }
    
    @IBAction func btnMyPagePressed(_ sender: Any) {
        moveView(view: 4)

    }
}
