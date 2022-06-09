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
    
    var secondaryName: String? {
        station.secondaryName
    }
    
    var upcomingTrips: [String: [TrainViewModel]] {
        let northArray = station.upcomingTrips["north"]
        let north = northArray.map({
            $0.map({
                TrainViewModel(trip: $0)
            })
        })
        let south = station.upcomingTrips["south"].map({
            $0.map({
                TrainViewModel(trip: $0)
            })
        })
        return [
            "north": north ?? [],
            "south": south ?? [],
        ]
    }
    
//    var projectedTime: String {
//        "10 Min"
//    }
//    
//    var currentLocation: String {
//        "3 min until 34th Street"
//    }
    
    init(station: StopDetailResponse) {
        self.station = station
    }
}
