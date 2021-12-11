//
//  RouteStatusView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/11/21.
//

import SwiftUI

struct RouteStatusView: View {
    var status: String
    var statusColor: Color {
        Color("color-" + status.lowercased().replacingOccurrences(of: " ", with: "-"))
    }
    var routes: [RouteViewModel]
    var body: some View {
        VStack {
            statusTitle
        }
            .background(.blue)
            .frame(width: 320)
    }
}

extension RouteStatusView {
    var statusTitle: some View {
        HStack {
            Text(status)
                .foregroundColor(statusColor)
        }
    }
}

struct RouteStatusView_Previews: PreviewProvider {
    static var routes = [
        RouteViewModel(route: routeA),
        RouteViewModel(route: route1),
        RouteViewModel(route: routeN),
        RouteViewModel(route: routeS),
        RouteViewModel(route: routeA),
        RouteViewModel(route: route1),
    ]
    static var previews: some View {
        RouteStatusView(status: "Good Service", routes: routes)
    }
}
