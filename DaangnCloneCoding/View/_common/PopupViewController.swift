//
//  PopupViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/17.
//

import UIKit

class PopupViewController: UIViewController {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var oneButton: UIButton!
    
    @IBOutlet weak var twoButton: UIStackView!
    @IBOutlet weak var twoButtonOk: UIButton!
    @IBOutlet weak var twoButtonCancel: UIButton!
    
    var delegate: PopupButtonDelegate?
    
    open var textContent: String?
    open var popupId: Int?
    open var isOneButton = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    func setupView() {
        popupView.layer.cornerRadius = 8
        oneButton.layer.cornerRadius = 8
        twoButtonOk.layer.cornerRadius = 8
        twoButtonCancel.layer.cornerRadius = 8
        
        lbTitle.text = textContent ?? ""
        
        if isOneButton {
            twoButton.isHidden = true
        } else {
            oneButton.isHidden = true
        }
        
        
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        self.dismiss(animated: false) {
            self.delegate?.buttonPressed(popupId: self.popupId, isOk: true)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: false) {
            self.delegate?.buttonPressed(popupId: self.popupId, isOk: false)
        }
    }
}
