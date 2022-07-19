//
//  JoinViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/17.
//

import UIKit

class JoinViewController: UIViewController, TextSearchDelegate {
    func textFieldChange(text: String) {
        textField.text = text.phoneNumSpace()
        if text.count == 13 {
            certButton.isEnabled = true
        } else {
            certButton.isEnabled = false
        }
    }
    @IBOutlet weak var textField: TextField_General!
    @IBOutlet weak var certButton: Button_General!
    
    var limit = 300
    var timerText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        certButton.isEnabled = false
        textField.searchDelegate = self
        textField.keyboardType = .numberPad
        certButton.btnMainColor = UIColor(named: "65,71,77")
    }
    
    @objc func setTime() {
        toTime(sec: limit)
        certButton.setTitle("인증문자 다시 받기(\(timerText))", for: .normal)
        limit -= 1
    }
    
    func toTime(sec: Int) {
        let minute = (sec % 3600) / 60
        let second = (sec % 3600) % 60
        
        if second < 10 {
            timerText = String(minute) + "분" + "0" + String(second) + "초"
        } else {
            timerText = String(minute) + "분" + String(second) + "초"
        }
        if limit > -1 {
            perform(#selector(setTime), with: nil, afterDelay: 1.0)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func certButtonPressed(_ sender: Any) {
        limit = 300
        setTime()
    }
    
    
}
