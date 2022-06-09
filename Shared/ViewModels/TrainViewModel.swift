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
    
    var routeId: String {
        trip.routeId
    }
    
    var arrivalTime: String {
        "\(trip.arrivalTime)"
    }
    
    var stop: String {
        "\(trip.upcomingStop)"
    }
    
    var destinationStop: String {
        trip.destinationStop
    }
    
    var minutesFromUpcomingStop: String {
        "\(trip.minutesFromUpcomingStop)"
    }
}
