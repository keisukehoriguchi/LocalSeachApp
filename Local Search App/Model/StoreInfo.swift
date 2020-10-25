//
//  StoreInfo.swift
//  Local Search App
//
//  Created by Keisuke Horiguchi on 2020/10/25.
//

import Foundation

struct Store: Codable {
    var name: String
    var address: String
    var telephone: String
    var tag: String
    
    init(data: [String: Any]) {
        name = data["name"] as? String ?? ""
        address = data["address"] as? String ?? ""
        telephone = data["telephone"] as? String ?? ""
        tag = data["tag"] as? String ?? ""
    }
}
