//
//  UIButton+.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/10/24.
//

import UIKit

extension UIButton {
    func setUI(image: String) {
        setImage(UIImage(systemName: image), for: .normal)
        layer.cornerRadius = 10
        backgroundColor = .systemBrown
        tintColor = .white
    }
}
