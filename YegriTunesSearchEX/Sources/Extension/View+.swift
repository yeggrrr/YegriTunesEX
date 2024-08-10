//
//  View+.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func setUI(bgColor: UIColor? = .white, borderwidth: CGFloat? = 2, borderColor: CGColor? = UIColor.systemBrown.cgColor, cornerRadius: CGFloat? = 10) {
        backgroundColor = bgColor
        layer.borderColor = borderColor
        if let borderwidth = borderwidth, let cornerRadius = cornerRadius {
            layer.borderWidth = borderwidth
            layer.cornerRadius = cornerRadius
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
