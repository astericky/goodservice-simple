//
//  GoodServiceViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/22/21.
//

import Combine
import SwiftUI

final class RouteViewModel: ObservableObject, Identifiable {
    
}

final class GoodServiceViewModel: ObservableObject, Identifiable {
    private var timestamp = ""
    
    @Published var routes = [RouteViewModel]()
    
}
