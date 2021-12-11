//
//  RouteViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/28/21.
//

import SwiftUI

final class RouteViewModel: ObservableObject, Identifiable {
    private var route: Route
    
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
    
    init(route: Route) {
        self.route = route
    }
}
