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
    let routes: [String: [String]]
}

struct StopsResponse: Codable {
    let stops: [Stop]
}
