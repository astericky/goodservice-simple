//
//  StationViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/29/21.
//

import Combine
import SwiftUI

final class StationViewModel: ObservableObject, Identifiable {
    @Published public var station: Stop
    
    var id: String {
        station.id
    }
    
    var name: String {
        station.name
    }
    
    var routes: [String] {
        Array<String>(station.routes.keys)
    }
    
    init(station: Stop) {
        self.station = station
    }
}
