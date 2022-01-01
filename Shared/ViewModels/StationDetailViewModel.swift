//
//  StationDetailViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/29/21.
//

import SwiftUI

final class StationDetailViewModel: ObservableObject {
    private var station: StopDetailResponse
    
    var id: String {
        station.id
    }
    
    var name: String {
        station.name
    }
    
    var secondaryName: String {
        station.secondaryName
    }
    
    var upcomingTrips: [String: [Trip]] {
        station.upcomingTrips
    }
    
    var projectedTime: String {
        "10 Min"
    }
    
    var currentLocation: String {
        "3 min until 34th Street"
    }
    
    init(station: StopDetailResponse) {
        self.station = station
    }
}
