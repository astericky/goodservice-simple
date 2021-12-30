//
//  RouteStatusView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/11/21.
//

import SwiftUI

struct RouteStatusView: View {
    @ObservedObject var viewModel: GoodServiceViewModel
    var status: String
    var statusColor: Color {
        Color("color-" + status.lowercased().replacingOccurrences(of: " ", with: "-"))
    }
    var statusForegroundColor: Color {
        status != "Not Scheduled" ? statusColor : Color.black
    }

    var body: some View {
        VStack {
            statusTitle
            horizontalList
        }
        .padding(.init(top: 16, leading: 0, bottom: 16, trailing: 16))
    }
}

extension RouteStatusView {
    var statusTitle: some View {
        HStack {
            Text(status)
                .textCase(.uppercase)
                .foregroundColor(statusForegroundColor)
            Spacer()
        }
    }
    
    var horizontalList: some View {
        VStack {
            if let routes = viewModel.routesByStatus[status] {
                HorizontalRouteListView(routes: routes)
            } else {
                EmptyView()
            }
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
    static var viewModel = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    static var previews: some View {
        Group {
            RouteStatusView(viewModel: viewModel, status: "Good Service")
                .previewLayout(.sizeThatFits)
        }
    }
}
