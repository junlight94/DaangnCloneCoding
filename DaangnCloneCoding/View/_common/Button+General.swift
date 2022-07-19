//
//  Button+General.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/12.
//

import UIKit

class Button_General: UIButton {
    
    var btnMainColor: UIColor?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = btnMainColor?.withAlphaComponent(0.9)
            } else {
                self.backgroundColor = btnMainColor
            }
        }
    }
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.backgroundColor = btnMainColor
            } else {
                self.backgroundColor = UIColor(named: "227,223,227")
            }
        }
    }
    
    func setupView() {
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .highlighted)
        setTitleColor(.white, for: .disabled)
        
        self.backgroundColor = UIColor(named: "MainColor")
        self.layer.cornerRadius = 8
    }
}
