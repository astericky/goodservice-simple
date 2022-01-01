//
//  StopDetailResponse.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/29/21.
//
/*
 JSON Response
 {
     "id": "D14",
     "name": "7 Av",
     "secondary_name": "53 St",
     "upcoming_trips": {
         "north": [
             {
                 "id": "070400_E..N",
                 "route_id": "E",
                 "direction": "north",
                 "previous_stop": "A27",
                 "previous_stop_arrival_time": 1640969806,
                 "upcoming_stop": "A25",
                 "upcoming_stop_arrival_time": 1640969958,
                 "estimated_upcoming_stop_arrival_time": 1640969901,
                 "current_stop_arrival_time": 1640970048,
                 "estimated_current_stop_arrival_time": 1640970002,
                 "destination_stop": "G05",
                 "delayed_time": 32,
                 "schedule_discrepancy": 18,
                 "is_delayed": false,
                 "timestamp": 1640969891
             },
             {
                 "id": "067900_D..N",
                 "route_id": "D",
                 "direction": "north",
                 "previous_stop": "D22",
                 "previous_stop_arrival_time": 1640969806,
                 "upcoming_stop": "D21",
                 "upcoming_stop_arrival_time": 1640969982,
                 "estimated_upcoming_stop_arrival_time": 1640969940,
                 "current_stop_arrival_time": 1640970612,
                 "estimated_current_stop_arrival_time": 1640970548,
                 "destination_stop": "D01",
                 "delayed_time": 0,
                 "schedule_discrepancy": 12,
                 "is_delayed": false,
                 "timestamp": 1640969911
             },
             {
                 "id": "071600_E..N",
                 "route_id": "E",
                 "direction": "north",
                 "previous_stop": "A34",
                 "previous_stop_arrival_time": 1640969876,
                 "upcoming_stop": "A33",
                 "upcoming_stop_arrival_time": 1640969966,
                 "estimated_upcoming_stop_arrival_time": 1640969985,
                 "current_stop_arrival_time": 1640970746,
                 "estimated_current_stop_arrival_time": 1640970729,
                 "destination_stop": "G05",
                 "delayed_time": 0,
                 "schedule_discrepancy": -4,
                 "is_delayed": false,
                 "timestamp": 1640969891
             },
             {
                 "id": "069300_D..N",
                 "route_id": "D",
                 "direction": "north",
                 "previous_stop": "R36",
                 "previous_stop_arrival_time": 1640969742,
                 "upcoming_stop": "R31",
                 "upcoming_stop_arrival_time": 1640970072,
                 "estimated_upcoming_stop_arrival_time": 1640970046,
                 "current_stop_arrival_time": 1640971392,
                 "estimated_current_stop_arrival_time": 1640971376,
                 "destination_stop": "D01",
                 "delayed_time": 0,
                 "schedule_discrepancy": -84,
                 "is_delayed": false,
                 "timestamp": 1640969911
             },
             {
                 "id": "072800_E..N",
                 "route_id": "E",
                 "direction": "north",
                 "previous_stop": null,
                 "previous_stop_arrival_time": null,
                 "upcoming_stop": "E01",
                 "upcoming_stop_arrival_time": 1640970480,
                 "estimated_upcoming_stop_arrival_time": 1640970480,
                 "current_stop_arrival_time": 1640971470,
                 "estimated_current_stop_arrival_time": 1640971430,
                 "destination_stop": "G05",
                 "delayed_time": 0,
                 "schedule_discrepancy": 0,
                 "is_delayed": false,
                 "timestamp": 1640969901
             },
             {
                 "id": "070900_D..N",
                 "route_id": "D",
                 "direction": "north",
                 "previous_stop": "B17",
                 "previous_stop_arrival_time": 1640969916,
                 "upcoming_stop": "B16",
                 "upcoming_stop_arrival_time": 1640970022,
                 "estimated_upcoming_stop_arrival_time": 1640970023,
                 "current_stop_arrival_time": 1640972332,
                 "estimated_current_stop_arrival_time": 1640972249,
                 "destination_stop": "D01",
                 "delayed_time": 0,
                 "schedule_discrepancy": -8,
                 "is_delayed": false,
                 "timestamp": 1640969916
             },
             {
                 "id": "074300_E..N",
                 "route_id": "E",
                 "direction": "north",
                 "previous_stop": null,
                 "previous_stop_arrival_time": null,
                 "upcoming_stop": "E01",
                 "upcoming_stop_arrival_time": 1640971380,
                 "estimated_upcoming_stop_arrival_time": 1640971380,
                 "current_stop_arrival_time": 1640972370,
                 "estimated_current_stop_arrival_time": 1640972330,
                 "destination_stop": "G05",
                 "delayed_time": 0,
                 "schedule_discrepancy": 0,
                 "is_delayed": false,
                 "timestamp": 1640969901
             },
             {
                 "id": "072700_D..N",
                 "route_id": "D",
                 "direction": "north",
                 "previous_stop": null,
                 "previous_stop_arrival_time": null,
                 "upcoming_stop": "B23",
                 "upcoming_stop_arrival_time": 1640970420,
                 "estimated_upcoming_stop_arrival_time": 1640970420,
                 "current_stop_arrival_time": 1640973420,
                 "estimated_current_stop_arrival_time": 1640973309,
                 "destination_stop": "D01",
                 "delayed_time": 0,
                 "schedule_discrepancy": 0,
                 "is_delayed": false,
                 "timestamp": 1640969925
             },
             {
                 "id": "074500_D..N",
                 "route_id": "D",
                 "direction": "north",
                 "previous_stop": null,
                 "previous_stop_arrival_time": null,
                 "upcoming_stop": "B23",
                 "upcoming_stop_arrival_time": 1640971500,
                 "estimated_upcoming_stop_arrival_time": 1640971500,
                 "current_stop_arrival_time": 1640974560,
                 "estimated_current_stop_arrival_time": 1640974389,
                 "destination_stop": "D01",
                 "delayed_time": 0,
                 "schedule_discrepancy": 0,
                 "is_delayed": false,
                 "timestamp": 1640969925
             }
         ],
         "south": [
             {
                 "id": "068350_D..S",
                 "route_id": "D",
                 "direction": "south",
                 "previous_stop": "A15",
                 "previous_stop_arrival_time": 1640969496,
                 "upcoming_stop": "A24",
                 "upcoming_stop_arrival_time": 1640969982,
                 "estimated_upcoming_stop_arrival_time": 1640969972,
                 "current_stop_arrival_time": 1640970102,
                 "estimated_current_stop_arrival_time": 1640970101,
                 "destination_stop": "B23",
                 "delayed_time": 0,
                 "schedule_discrepancy": 162,
                 "is_delayed": false,
                 "timestamp": 1640969566
             },
             {
                 "id": "069500_E..S",
                 "route_id": "E",
                 "direction": "south",
                 "previous_stop": "F09",
                 "previous_stop_arrival_time": 1640969820,
                 "upcoming_stop": "F11",
                 "upcoming_stop_arrival_time": 1640969991,
                 "estimated_upcoming_stop_arrival_time": 1640969994,
                 "current_stop_arrival_time": 1640970201,
                 "estimated_current_stop_arrival_time": 1640970180,
                 "destination_stop": "E01",
                 "delayed_time": 0,
                 "schedule_discrepancy": -219,
                 "is_delayed": false,
                 "timestamp": 1640969891
             },
             {
                 "id": "070150_D..S",
                 "route_id": "D",
                 "direction": "south",
                 "previous_stop": "D10",
                 "previous_stop_arrival_time": 1640969856,
                 "upcoming_stop": "D11",
                 "upcoming_stop_arrival_time": 1640969994,
                 "estimated_upcoming_stop_arrival_time": 1640969987,
                 "current_stop_arrival_time": 1640970984,
                 "estimated_current_stop_arrival_time": 1640971036,
                 "destination_stop": "B23",
                 "delayed_time": 0,
                 "schedule_discrepancy": -36,
                 "is_delayed": false,
                 "timestamp": 1640969916
             },
             {
                 "id": "071000_E..S",
                 "route_id": "E",
                 "direction": "south",
                 "previous_stop": "G05",
                 "previous_stop_arrival_time": 1640969400,
                 "upcoming_stop": "G06",
                 "upcoming_stop_arrival_time": 1640969958,
                 "estimated_upcoming_stop_arrival_time": 1640969442,
                 "current_stop_arrival_time": 1640971788,
                 "estimated_current_stop_arrival_time": 1640971189,
                 "destination_stop": "E01",
                 "delayed_time": 491,
                 "schedule_discrepancy": 468,
                 "is_delayed": true,
                 "timestamp": 1640969891
             },
             {
                 "id": "071950_D..S",
                 "route_id": "D",
                 "direction": "south",
                 "previous_stop": null,
                 "previous_stop_arrival_time": null,
                 "upcoming_stop": "D01",
                 "upcoming_stop_arrival_time": 1640969970,
                 "estimated_upcoming_stop_arrival_time": 1640969970,
                 "current_stop_arrival_time": 1640972100,
                 "estimated_current_stop_arrival_time": 1640971985,
                 "destination_stop": "B23",
                 "delayed_time": 0,
                 "schedule_discrepancy": 0,
                 "is_delayed": false,
                 "timestamp": 1640969925
             },
             {
                 "id": "072500_E..S",
                 "route_id": "E",
                 "direction": "south",
                 "previous_stop": null,
                 "previous_stop_arrival_time": null,
                 "upcoming_stop": "G05",
                 "upcoming_stop_arrival_time": 1640970300,
                 "estimated_upcoming_stop_arrival_time": 1640970300,
                 "current_stop_arrival_time": 1640972220,
                 "estimated_current_stop_arrival_time": 1640972089,
                 "destination_stop": "E01",
                 "delayed_time": 0,
                 "schedule_discrepancy": 0,
                 "is_delayed": false,
                 "timestamp": 1640969901
             },
             {
                 "id": "074000_E..S",
                 "route_id": "E",
                 "direction": "south",
                 "previous_stop": null,
                 "previous_stop_arrival_time": null,
                 "upcoming_stop": "G05",
                 "upcoming_stop_arrival_time": 1640971200,
                 "estimated_upcoming_stop_arrival_time": 1640971200,
                 "current_stop_arrival_time": 1640973120,
                 "estimated_current_stop_arrival_time": 1640972989,
                 "destination_stop": "E01",
                 "delayed_time": 0,
                 "schedule_discrepancy": 0,
                 "is_delayed": false,
                 "timestamp": 1640969901
             },
             {
                 "id": "073750_D..S",
                 "route_id": "D",
                 "direction": "south",
                 "previous_stop": null,
                 "previous_stop_arrival_time": null,
                 "upcoming_stop": "D01",
                 "upcoming_stop_arrival_time": 1640971050,
                 "estimated_upcoming_stop_arrival_time": 1640971050,
                 "current_stop_arrival_time": 1640973180,
                 "estimated_current_stop_arrival_time": 1640973065,
                 "destination_stop": "B23",
                 "delayed_time": 0,
                 "schedule_discrepancy": 0,
                 "is_delayed": false,
                 "timestamp": 1640969925
             }
         ]
     },
     "timestamp": 1640969933
 }
 */

import Foundation

struct Trip: Codable, Identifiable {
    let id: String
    let routeId: String
    let upcomingStopArrivalTime: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case routeId = "route_id"
        case upcomingStopArrivalTime = "upcoming_stop_arrival_time"
    }
}

extension Trip {
    var arrivalTime: String {
        let newDate = Date(timeIntervalSince1970: upcomingStopArrivalTime)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        return formatter.string(from: newDate)
    }
}

struct StopDetailResponse: Codable {
    let id: String
    let name: String
    let secondaryName: String
    let upcomingTrips: [String: [Trip]]
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case secondaryName = "secondary_name"
        case upcomingTrips = "upcoming_trips"
        case timestamp
    }
}


