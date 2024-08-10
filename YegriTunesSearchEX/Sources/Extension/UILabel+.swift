//
//  UILabel+.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/10/24.
//

import UIKit

extension UILabel {
    func setUI(txt: String? = nil, txtColor: UIColor? = .black, numOfLines: Int? = 1, fontStyle: UIFont, txtAlignment: NSTextAlignment? = .left) {
        text = txt
        textColor = txtColor
        font = fontStyle
        if let numOfLines = numOfLines, let txtAlignment = txtAlignment {
            numberOfLines = numOfLines
            textAlignment = txtAlignment
        }
    }
}
