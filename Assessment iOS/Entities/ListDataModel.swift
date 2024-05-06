//
//  PostModel.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//

import Foundation
import ObjectMapper

struct ListDataModel: Codable {
    var stateProvince: String?
    var domains: [String]?
    var webPages: [String]?
    var name: String?
    var alphaTwoCode: String?
    var country: String?

    enum CodingKeys: String, CodingKey {
        case stateProvince = "state-province"
        case domains
        case webPages = "web_pages"
        case name
        case alphaTwoCode = "alpha_two_code"
        case country
    }
}
extension ListDataModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        stateProvince       <- map["state-province"]
        domains     <- map["domains"]
        webPages     <- map["web_pages"]
        name     <- map["name"]
        alphaTwoCode     <- map["alpha_two_code"]
        country     <- map["country"]
    }
    
}
