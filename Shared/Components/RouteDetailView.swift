//
//  RouteDetailView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/18/21.
//

import SwiftUI

struct RouteDetailView: View {
    var route: RouteViewModel
    var body: some View {
        VStack {
            Text(route.name)
            Spacer()
        }
    }
}

struct RouteDetailView_Previews: PreviewProvider {
    static var route = RouteViewModel(route: routeA)
    static var previews: some View {
        RouteDetailView(route: route)
    }
}
