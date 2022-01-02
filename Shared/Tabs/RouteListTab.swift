//
//  RouteListTab.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/10/21.
//

import SwiftUI

struct RouteListTab: View {
    @EnvironmentObject var vm: GoodServiceViewModel
    var statusList: [String] {
        Array<String>(vm.routesByStatus.keys)
    }

    var body: some View {
        NavigationView {
            List(statusList, id: \.self) { status in
                RouteStatusView(viewModel: vm, status: status)
            }
            .listStyle(.plain)
            .navigationTitle("Trains")
        }
    }
}

struct RouteListTab_Previews: PreviewProvider {
    static var previews: some View {
        RouteListTab()
            .environmentObject(GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher()))
    }
}
