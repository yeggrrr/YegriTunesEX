//
//  ReusableProtocol.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import UIKit

protocol ReusableProtocol: AnyObject {
    static var id: String { get }
}

extension UITableViewCell: ReusableProtocol {
    static var id: String {
        return String(describing: self)
    }
}
