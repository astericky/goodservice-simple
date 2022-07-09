//
//  RouteDetailViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/19/21.
//

import SwiftUI

final class RouteDetailViewModel: ObservableObject {
    private var route: RouteDetailResponse
    
    var serviceChangeSummaries: [String: [String]] {
        route.serviceChangeSummaries ?? [:]
    }
    
    var serviceIrregularitySummaries: [String: String?] {
        route.serviceIrregularitySummaries ?? [:]
    }
    
    var blendedRoute: [String] {
        route.actualRoutings?["north"]?[0] ?? []
    }
    
    var northRoute: [String] {
        route.actualRoutings?["north"]?[0] ?? []
    }
    
    var southroute: [String] {
        route.actualRoutings?["south"]?[0] ?? []
    }
    
    init(route: RouteDetailResponse) {
        self.route = route
    }
}
