//
//  StationListTab.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/28/21.
//

import SwiftUI

struct StationListTab: View {
    @ObservedObject var viewModel: GoodServiceViewModel
    var stations: [StationViewModel] {
        viewModel.stations
    }
    var body: some View {
        NavigationView {
            List(stations) { station in
                NavigationLink(destination: StationDetailView()) {
                    Text(station.name)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Stations")
        }
    }
}

struct StationListTab_Previews: PreviewProvider {
    static var viewModel = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    static var previews: some View {
        StationListTab(viewModel: viewModel)
    }
}
