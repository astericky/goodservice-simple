//
//  RouteListTab.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/10/21.
//

import SwiftUI

struct RouteListTab: View {
    @ObservedObject var viewModel: GoodServiceViewModel
    var statusList: [String] {
        Array<String>(viewModel.routesByStatus.keys)
    }

    var body: some View {
        NavigationView {
            List(statusList, id: \.self) { status in
                RouteStatusView(viewModel: viewModel, status: status)
            }
            .listStyle(.plain)
            .navigationTitle("Trains")
        }
    }
}

struct RouteListTab_Previews: PreviewProvider {
    static var previews: some View {
        RouteListTab(viewModel: GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher()))
    }
}
