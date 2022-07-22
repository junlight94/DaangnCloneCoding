//
//  JoinViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/17.
//

import UIKit

class JoinViewController: UIViewController, TextSearchDelegate {
    func textFieldChange(textFieldId:Int, text: String) {
        if textFieldId == 0 {
            textField.text = text.phoneNumSpace()
            if text.count == 13 {
                certButton.isEnabled = true
            } else {
                certButton.isEnabled = false
            }
        } else {
            if agreeTextField.text == "941117" {
                agreeButton.isEnabled = true
            } else {
                agreeButton.isEnabled = false
            }
        }
    }
    
    
    @IBOutlet weak var agreeTextField: TextField_General!
    @IBOutlet weak var textField: TextField_General!
    @IBOutlet weak var certButton: Button_General!
    
    @IBOutlet weak var agreeView: UIView!
    @IBOutlet weak var agreeButton: Button_General!
    
    var limit = 300
    var timerText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        certButton.isEnabled = false
        agreeButton.isEnabled = false
        
        textField.searchDelegate = self
        agreeTextField.searchDelegate = self
        
        textField.textFieldId = 0
        agreeTextField.textFieldId = 1
        
        textField.keyboardType = .numberPad
        agreeTextField.keyboardType = .numberPad
        
        certButton.btnMainColor = UIColor(named: "65,71,77")
        agreeButton.btnMainColor = UIColor(named: "MainColor")
        
        agreeView.isHidden = true
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
    
    func showToast() {
        let toastView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        toastView.backgroundColor = UIColor(named: "65,71,77")
        let toastLabel = UILabel()
        toastLabel.textAlignment = .center
        toastLabel.text = "인증번호가 문자로 전송됐습니다.(최대 20초 소요)"
        toastLabel.textColor = UIColor.white
        toastLabel.alpha = 1.0
        
        toastView.addSubview(toastLabel)
        
        toastLabel.snp.makeConstraints{ (make) in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().offset(10)
        }
        
        self.view.addSubview(toastView)
        
        UIView.animate(withDuration: 4.0, delay: 0, options: .curveEaseIn) {
            toastView.alpha = 0
        } completion: { Bool in
            toastView.removeFromSuperview()
        }

        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func certButtonPressed(_ sender: Any) {
        showToast()
        agreeView.isHidden = false
        limit = 300
        setTime()
    }
    
    @IBAction func btnAgreePressed(_ sender: Any) {
        self.appDelegate.switchMain()
    }
    
}
