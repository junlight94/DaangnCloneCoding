//
//  JoinViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/17.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var certButton: Button_General!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        certButton.isEnabled = false
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
