//
//  StopsResponse.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/3/21.
//

import Foundation

struct Stop: Codable {
    let id: String
    let name: String
    let secondaryName: String?
    let routes: [String: [String]]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case secondaryName = "secondary_name"
        case routes
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        secondaryName = try values.decodeIfPresent(String.self, forKey: .secondaryName)
        routes = try values.decode([String: [String]].self, forKey: .routes)
    }
    
    init(id: String, name: String, secondaryName: String?, routes: [String: [String]]) {
        self.id = id
        self.name = name
        self.secondaryName = secondaryName
        self.routes = routes
    }
}

struct StopsResponse: Codable {
    let stops: [Stop]
}
