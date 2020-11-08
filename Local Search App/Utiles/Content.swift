//
//  Content.swift
//  Local Search App
//
//  Created by Keisuke Horiguchi on 2020/10/25.
//

import Foundation
import UIKit

struct identifiers {
    static let resultTableViewCell = "ResultTableViewCell"
    static let toStoreDetailVC = "toStoreDetailVC"
}

extension UIViewController {
    func simpleAlert(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
