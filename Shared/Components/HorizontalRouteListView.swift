//
//  RouteListView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/22/21.
//

import SwiftUI
import WrappingHStack

class SelectedRouteManager: ObservableObject {
    @Published var selectedRoute: RouteViewModel? = nil
    @Published var showRoute = false
}

struct HorizontalRouteListView: View {
    @StateObject private var selectedRouteManager = SelectedRouteManager()
    
    var routes = [RouteViewModel]()
    var body: some View {
        WrappingHStack(routes, alignment: .leading, spacing: .constant(8)) { route in
            RouteIconView(route: route)
                .onTapGesture {
                    self.selectedRouteManager.selectedRoute = route
                    self.selectedRouteManager.showRoute.toggle()
                }
        }
        .frame(maxWidth: 360)
        .sheet(isPresented: $selectedRouteManager.showRoute) {
            if let routeToShow = selectedRouteManager.selectedRoute {
                RouteDetailView(routeViewModel: routeToShow)
            } else {
                Text("There is no route to show.")
            }
        }
    }
}

struct HorizontalRouteListView_Previews: PreviewProvider {
    static var routes = [
        RouteViewModel(route: routeA),
        RouteViewModel(route: route1),
        RouteViewModel(route: routeN),
        RouteViewModel(route: routeS),
        RouteViewModel(route: routeA),
        RouteViewModel(route: route1),
        RouteViewModel(route: routeN),
        RouteViewModel(route: routeS),
        RouteViewModel(route: routeA),
        RouteViewModel(route: route1),
        RouteViewModel(route: routeN),
        RouteViewModel(route: routeS),
        RouteViewModel(route: routeA),
        RouteViewModel(route: route1),
        RouteViewModel(route: routeN),
        RouteViewModel(route: routeS),
    ]
    static var previews: some View {
        HorizontalRouteListView(routes: routes)
            .previewLayout(.sizeThatFits)
    }
}
