//
//  Delegate.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/14.
//

import UIKit



// 팝업 delegate
protocol PopupButtonDelegate: AnyObject {
    func buttonPressed(popupId: Int?, isOk: Bool)
}
