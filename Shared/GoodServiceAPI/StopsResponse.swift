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
}

struct StopsResponse: Codable {
    let stops: [Stop]
}
