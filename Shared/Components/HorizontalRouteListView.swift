//
//  RouteListView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/22/21.
//

import SwiftUI
import WrappingHStack

struct HorizontalRouteListView: View {
    var routes = [RouteViewModel]()

    var body: some View {
        WrappingHStack(routes, alignment: .leading, spacing: .constant(8)) { route in
                Text(route.name)
                    .foregroundColor(route.textColor)
                    .frame(width: 25, height:25)
                    .background(route.bgColor)
                    .clipShape(Circle())
                    .padding(.vertical, 4)
        }.frame(maxWidth: .infinity)
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
    }
}
