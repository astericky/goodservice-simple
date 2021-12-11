//
//  RouteListTab.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/10/21.
//

import SwiftUI

struct RouteListTab: View {
    var routes = [String: [RouteViewModel]]()
    var statusList: [String] {
        Array<String>(routes.keys)
    }
    var body: some View {
        VStack {
            ForEach(statusList, id: \.self) { status in
                Text(status)
                if let routesWithStatus = routes[status] {
                    HorizontalRouteListView(routes: routesWithStatus)
                }
            }
        }
    }
}

struct RouteListTab_Previews: PreviewProvider {
    static var viewModel = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    static var previews: some View {
        RouteListTab(routes: viewModel.routesByStatus)
    }
}
