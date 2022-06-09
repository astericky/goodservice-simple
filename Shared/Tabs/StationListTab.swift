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
                ZStack {
                    NavigationLink(destination: StationDetailView(station: station)) {
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text(station.name)
                            if !station.secondaryName.isEmpty {
                                Text(station.secondaryName)
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                            }
                        }
                        .fixedSize()

                        Spacer()
                        stationRoutes(routeNames: station.routes)
                    }
                    .background(Color.white)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Stations")
        }
    }
}

extension StationListTab {
    func stationRoutes(routeNames: [String]) -> some View {
        var routes = [RouteViewModel]()
        let filteredRouteNames = routeNames.map ({ (routeName) -> String in
            if routeName == "SIR" {
                return routeName
            }
            return "\(routeName.prefix(1))"
        })
        for route in filteredRouteNames {
            if let routeVM = vm.routesDictionary[route] {
                routes.append(routeVM)
            }
        }

        return HorizontalRouteListView(routes: routes, size: "small")
    }
    
}

struct StationListTab_Previews: PreviewProvider {
    static var previews: some View {
        StationListTab()
            .environmentObject(GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher()))
    }
}
