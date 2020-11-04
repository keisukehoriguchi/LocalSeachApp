//
//  Response.swift
//  Local Search App
//
//  Created by Keisuke Horiguchi on 2020/11/03.
//

import Foundation

struct Response: Codable {
    var stores: [Store] = []
    
    enum CodingKeys: String, CodingKey {
        case stores = "Feature"
    }
    
    struct Store: Codable {
        var name: String = ""
        var category: [String]? = []
        var property = Property()
        
        enum CodingKeys: String, CodingKey {
            case name = "Name"
            case category = "Category"
            case property = "Property"
        }
        
        struct Property: Codable {
            var telephone: String? = ""
            var address: String = ""
            
            enum CodingKeys: String, CodingKey {
                case telephone = "Tel1"
                case address = "Address"
            }
        }
    }
}
