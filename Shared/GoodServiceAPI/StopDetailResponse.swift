//
//  StopDetailResponse.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/29/21.
//

import Foundation

struct Trip: Codable {
    let id: String
    let routeId: String
    let upcomingStopArrivalTime: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case routeId = "route_id"
        case upcomingStopArrivalTime = "upcoming_stop_arrival_time"
    }
}

struct StopDetailResponse: Codable {
    let id: String
    let name: String
    let upcomingTrips: [String: [Trip]]
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case upcomingTrips = "upcoming_trips"
        case timestamp
    }
}


