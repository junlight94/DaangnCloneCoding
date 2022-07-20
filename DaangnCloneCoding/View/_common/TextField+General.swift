//
//  TextField+Search.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/13.
//

import UIKit


class TextField_General: UITextField {
    
    var searchDelegate: TextSearchDelegate?
    
    let ivSearch = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
    let btnClose = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
    let padding = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
    
    var textFieldId: Int?
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func setupView() {
        delegate = self
        
        borderStyle = .none
        returnKeyType = .done
        
        layer.borderWidth = 1
        layer.cornerRadius = 8
        layer.borderColor = UIColor(named: "65,71,77")?.withAlphaComponent(0.05).cgColor
        font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        
        if let ph = placeholder?.description {
            attributedPlaceholder = NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.4) as Any])
        }
        
    }
    
}

extension TextField_General: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor(named: "65,71,77")?.cgColor
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        self.layer.borderColor = UIColor(named: "65,71,77")?.withAlphaComponent(0.05).cgColor

        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text{
            searchDelegate?.textFieldChange(textFieldId: textFieldId ?? 0, text: text)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // backspace 허용
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }

        guard let text = textField.text else { return false }
        if text.count >= 13 {
            return false
        }

        return true
    }
}
