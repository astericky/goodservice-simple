//
//  RouteListView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/22/21.
//

import SwiftUI

class SelectedRouteManager: ObservableObject {
    @Published var selectedRoute: RouteViewModel? = nil
    @Published var showRoute = false
}

struct HorizontalRouteListView: View {
    @StateObject private var selectedRouteManager = SelectedRouteManager()
    
    var routes = [RouteViewModel]()
    var colums = [GridItem(.fixed(25)),
                  GridItem(.fixed(25)),
                  GridItem(.fixed(25)),
                  GridItem(.fixed(25)),
                  GridItem(.fixed(25)),
                  GridItem(.fixed(25)),
                  GridItem(.fixed(25)),
                  GridItem(.fixed(25)),
                  GridItem(.fixed(25)),
                  GridItem(.fixed(25))]
    var body: some View {
        LazyVGrid(columns: colums) {
            ForEach(routes) { route in
                RouteIconView(route: route)
                    .onTapGesture {
                        self.selectedRouteManager.selectedRoute = route
                        self.selectedRouteManager.showRoute.toggle()
                    }
            }
        }
        .frame(maxWidth: 360)
        .sheet(isPresented: $selectedRouteManager.showRoute) {
            if let routeToShow = selectedRouteManager.selectedRoute {
                RouteDetailView(route: routeToShow)
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
