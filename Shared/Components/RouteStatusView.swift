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
        GeometryReader { proxy in
            VStack {
                statusTitle
                    .frame(width: proxy.size.width)
                horizontalList
                    .frame(width: proxy.size.width)
            }
        }
    }
}

extension RouteStatusView {
    var statusTitle: some View {
        HStack {
            Text(status)
                .foregroundColor(statusColor)
            Spacer()
        }.padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
    }
    
    var horizontalList: some View {
        VStack {
            if !routes.isEmpty {
                HorizontalRouteListView(routes: routes)
            } else {
                EmptyView()
            }
        }.padding(.init(top: 4, leading: 8, bottom: 0, trailing: 8))
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
        RouteStatusView(status: "No Service", routes: routes)
    }
}
