//
//  RouteDetailViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/19/21.
//

import SwiftUI

final class RouteDetailViewModel: ObservableObject {
    private var route: RouteDetailResponse
    
    var id: String {
        route.id
    }
    
    var name: String {
        String(route.name.prefix(1))
    }
    
    var alternateName: String? {
        route.alternateName
    }
    
    var status: String {
        route.status
    }
    
    var bgColor: Color {
        Color.createColor(from: route.color)
    }
    
    var textColor: Color {
        Color.createColor(from: route.textColor ?? "#FFFFFF")
    }
    
    var statusColor: Color {
        Color.getColor(from: route.status)
    }
    
    var serviceChangeSummaries: [String: [String]] {
        route.serviceChangeSummaries
    }
    
    init(route: RouteDetailResponse) {
        self.route = route
    }
}
