//
//  StationListTab.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/28/21.
//

import SwiftUI

struct StationListTab: View {
    @EnvironmentObject var vm: GoodServiceViewModel
    
    var stations: [StationViewModel] {
        vm.stations
    }

    var body: some View {
        NavigationView {
            List(stations) { station in
                NavigationLink(destination: StationDetailView(station: station)) {
                    Text(station.name)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Stations")
        }
    }
}

struct StationListTab_Previews: PreviewProvider {
    static var previews: some View {
        StationListTab()
            .environmentObject(GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher()))
    }
}
