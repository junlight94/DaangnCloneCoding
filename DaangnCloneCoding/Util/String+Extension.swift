//
//  String+Extension.swift
//  DaangnCloneCoding
//
//  Created by Junyoung on 2022/07/19.
//

import UIKit

extension String {
    
    func phoneNumSpace() -> String {
        var digits = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)

        digits = digits.replacingOccurrences(of: "(\\d{3})(\\d{4})(\\d{1,4})", with: "$1 $2 $3", options: .regularExpression, range: nil)
        return digits
    }
    
}
