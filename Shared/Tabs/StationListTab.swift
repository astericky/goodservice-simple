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
                    Text(station.secondaryName)
                        .font(.caption)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                    Spacer()
                    stationRoutes(routeNames: station.routes)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Stations")
        }
    }
}

extension StationListTab {
    func stationRoutes(routeNames: [String]) -> some View {
        let filteredRouteNames = routeNames.map ({ (routeName) -> String in
            if routeName == "SIR" {
                return routeName
            }
            return "\(routeName.prefix(1))"
        })
        let routes = filteredRouteNames.map {
            vm.routesDictionary[$0]!
        }
        print("stationRoutes :: routes :: ", routes)
        return HorizontalRouteListView(routes: routes, size: "small")
    }
    
}

struct StationListTab_Previews: PreviewProvider {
    static var previews: some View {
        StationListTab()
            .environmentObject(GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher()))
    }
}
