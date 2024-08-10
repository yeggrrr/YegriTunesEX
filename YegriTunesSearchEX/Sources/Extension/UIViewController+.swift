//
//  UIViewController+.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/10/24.
//

import UIKit

extension UIViewController {
    
    func setCoverImage(imageURL: String) -> String {
        let removeSize = imageURL.components(separatedBy: "100x100bb.jpg")
            .joined()
        let addNewSize = removeSize + "1000x1000bb.jpg"
        return addNewSize
    }
}
