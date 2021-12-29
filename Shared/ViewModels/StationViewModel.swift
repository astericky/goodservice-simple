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

// Used to conform to the protocal Hashable with gives one the ability to
// differentiate between one item compared to another item
extension StationViewModel: Hashable {
  static func == (lhs: StationViewModel, rhs: StationViewModel) -> Bool {
    return lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.name)
  }
}
