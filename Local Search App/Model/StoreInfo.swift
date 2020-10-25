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
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case address = "Address"
        case telephone = "Tel1"
        case tag = "Category"
    }

}
