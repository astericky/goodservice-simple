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
        route.serviceChangeSummaries
    }
    
    var serviceIrregularitySummaries: [String: String] {
        route.serviceIrregularitySummaries
    }
    
    init(route: RouteDetailResponse) {
        self.route = route
    }
}
