//
//  TextField+Search.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/13.
//

import UIKit
import SnapKit



class TextField_Search: UITextField, UITextFieldDelegate {
    
    var searchDelegate: TextSearchDelegate?
    
    let ivSearch = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
    let btnClose = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
    let padding = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text{
            searchDelegate?.textFieldChange(textFieldId: 0, text: text)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func setupView() {
        delegate = self
        
        borderStyle = .none
        returnKeyType = .done
        
        let border = CALayer()
        border.frame = CGRect(x: 0, y: frame.size.height-1, width: frame.width, height: 1)
        border.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.addSublayer(border)
        
        font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        
        if let ph = placeholder?.description {
            attributedPlaceholder = NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.4) as Any])
        }
        
        if #available(iOS 13.0, *) {
            ivSearch.image = UIImage(systemName: "magnifyingglass")
            btnClose.setImage(UIImage(systemName: "xmark"), for: .normal)
            
        } else {
            // Fallback on earlier versions
        }

        ivSearch.tintColor = UIColor.black
        btnClose.tintColor = UIColor.black
        
        addSubview(btnClose)
        addSubview(ivSearch)
        
        ivSearch.snp.makeConstraints{ (make) in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        btnClose.snp.makeConstraints{ (make) in
            make.width.height.equalTo(14)
            make.trailing.equalToSuperview().offset(-14)
            make.centerY.equalToSuperview()
        }
        
        btnClose.addTarget(self, action: #selector(OnClickClose), for: .touchUpInside)
        
    }
    
    @objc func OnClickClose() {
        text = ""
    }
}
