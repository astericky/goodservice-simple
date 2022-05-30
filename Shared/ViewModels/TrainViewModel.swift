//
//  TrainViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 2/12/22.
//

import Foundation


struct TrainViewModel: Identifiable {
    var trip: Trip
    
    var id: String {
        trip.id
    }
    
    var arrivalTime: String {
        "\(trip.arrivalTime)"
    }
    
    var stop: String {
        "\(trip.upcomingStop)"
    }
    
    var minutesFromUpcomingStop: String {
        "\(trip.minutesFromUpcomingStop)"
    }
}
