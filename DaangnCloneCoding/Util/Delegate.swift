//
//  Delegate.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/14.
//

import UIKit

// TextField 글자 확인을 위한 딜리게이트
protocol TextSearchDelegate {
    func textFieldChange(text: String)
}

// 팝업 delegate
protocol PopupButtonDelegate: AnyObject {
    func buttonPressed(popupId: Int?, isOk: Bool)
}
