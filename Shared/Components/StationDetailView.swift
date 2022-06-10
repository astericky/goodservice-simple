//
//  StationDetailView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/29/21.
//

import SwiftUI
import WrappingHStack

struct StationDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: GoodServiceViewModel
    @ObservedObject var station: StationViewModel
    
    var connectingRoutes: [RouteViewModel] {
        var routeViewModelArray = [RouteViewModel]()
        for name in station.routes {
            if let routeVM = vm.getRoute(by: name) {
                routeViewModelArray.append(routeVM)
            }
        }
        return routeViewModelArray
    }
    
    var body: some View {
        VStack {
            header
            upcomingTrainTimes
        }.navigationBarHidden(true)
            .onAppear {
                //#if DEBUG
                //        station.fetchStationFromLocalData()
                //#else
                        station.fetchStationFromAPI()
                        station.refreshStationData()
                //#endif
            }
    }
    
    init(station: StationViewModel) {
        self.station = station
    }
}

extension StationDetailView {
    private var header: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left.circle")
                        Text("Stations")
                    }
                }
                Spacer()
            }
            HStack(alignment: .center) {
                VStack(alignment: station.stationDetail?.secondaryName != nil ? .leading : .center) {
                    Text(station.name)
                        .font(.headline)
                    if let secondaryName = station.stationDetail?.secondaryName {
                        Text(secondaryName)
                            .font(.caption)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                    }
                }
                HorizontalRouteListView(routes: connectingRoutes, size: "small")
            }
        }
        .padding()
        .padding(.top, 0)
    }
    
    private var upcomingTrainTimes: some View {
        
        GeometryReader { proxy in
            let width = proxy.size.width
            let largeColumnWidth = (proxy.size.width - 32) * 0.3
            let smallColumnWidth = (proxy.size.width - 32) * 0.2

            VStack {
                Text("Upcoming Train Times")
                    .bold()
                    .padding(.bottom, 8)
                if let trips = station.stationDetail?.upcomingTrips["north"] {
                    Text(getDestinations(with: trips))
                        .font(.system(size: 16))
                        .padding(.leading, 16)
                        .frame(width: width, alignment: .leading)
                    List {
                        HStack {
                            Text("Train ID / Destination")
                                .frame(width: largeColumnWidth, alignment: .leading)
                            Spacer()
                            Text("Projected Time")
                                .frame(width: smallColumnWidth, alignment: .leading)
                            Spacer()
                            Text("Current Location")
                                .frame(width: smallColumnWidth, alignment: .leading)
//                            Spacer()
//                            Text("Schedule Adherence")
//                                .frame(width: smallColumnWidth, alignment: .trailing)
                        }.font(.caption)
                        
                        ForEach(trips) { trip in
                            HStack {
                                HStack {
                                    if let route = vm.routesDictionary[trip.routeId] {
                                        RouteIconView(route: route)
                                    }
                                    
                                    Text(trip.id)
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                }
                                    .frame(width: largeColumnWidth, alignment: .leading)
                                Spacer()
                                Text("\(trip.arrivalTime)")
                                    .frame(width: smallColumnWidth, alignment: .leading)
                                Spacer()
                                Text("\(trip.minutesFromUpcomingStop) until \(getStationName(with: trip.stop))")
                                    .frame(width: smallColumnWidth, alignment: .leading)
//                                    Spacer()
//                                    Text("10 min")
//                                        .frame(width: smallColumnWidth, alignment: .trailing)
                            }.font(.caption)

                        }

                        
                    }
                    .listStyle(PlainListStyle())
                }
                
                if let trips = station.stationDetail?.upcomingTrips["south"] {
                    Text(getDestinations(with: trips))
                        .font(.system(size: 16))
                        .padding(.leading, 16)
                        .frame(width: width, alignment: .leading)
                    List {
                        HStack {
                            Text("Train ID / Destination")
                                .frame(width: largeColumnWidth, alignment: .leading)
                            Spacer()
                            Text("Projected Time")
                                .frame(width: smallColumnWidth, alignment: .leading)
                            Spacer()
                            Text("Current Location")
                                .frame(width: smallColumnWidth, alignment: .leading)
//                            Spacer()
//                            Text("Schedule Adherence")
//                                .frame(width: smallColumnWidth, alignment: .trailing)
                        }.font(.caption)
                        
                        ForEach(trips) { trip in
                            HStack {
                                HStack {
                                    if let route = vm.routesDictionary[trip.routeId] {
                                        RouteIconView(route: route)
                                    }
                                    Text(trip.id)
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                }
                                    .frame(width: largeColumnWidth, alignment: .leading)
                                Spacer()
                                Text("\(trip.arrivalTime)")
                                    .frame(width: smallColumnWidth, alignment: .leading)
                                Spacer()
                                Text("\(trip.minutesFromUpcomingStop) until \(getStationName(with: trip.stop))")
                                    .frame(width: smallColumnWidth, alignment: .leading)
//                                    Spacer()
//                                    Text("10 min")
//                                        .frame(width: smallColumnWidth, alignment: .trailing)
                            }.font(.caption)

                        }

                        
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
    }
    
    func getDestinations(with trips: [TrainViewModel]) -> String {
        let destinationStops = Set<String>(trips.map { $0.destinationStop })
        let destinationNames = destinationStops.map { getStationName(with: $0) }
        return destinationNames.joined(separator: ", ")
    }
    
    func getStationName(with id: String) -> String {
        return vm.stations.first(where: { $0.id == id})?.name ?? ""
    }
}


struct StationDetailView_Previews: PreviewProvider {
    static var stop = Stop(id: "E01", name: "World Trade Center", secondaryName: "9th Street World View", routes: [
        "E": ["north", "south"],
        "F": ["north", "south"]
    ])
    static var stopDetailResponse = StopDetailResponse(id: "L06", name: "1 Av", secondaryName: "World Trade Center", upcomingTrips: [
        "north": [
            Trip(id: "005300_E..N", routeId: "E", upcomingStop: "A25", upcomingStopArrivalTime: 1640757180, destinationStop: "G05"),
            Trip(id: "006850_E..N", routeId: "E", upcomingStop: "D21", upcomingStopArrivalTime: 1640758110, destinationStop: "D01")
        ],
        "south": [
            Trip(id: "142350_E..S", routeId: "E", upcomingStop: "A33", upcomingStopArrivalTime: 1640756706, destinationStop: "G05"),
            Trip(id: "143800_E..S", routeId: "E", upcomingStop: "D22", upcomingStopArrivalTime: 1640756706, destinationStop: "D01")
        ]
    ], timestamp: 1640756653)
    static var stationDetail = StationDetailViewModel(station: stopDetailResponse)
    static var station = StationViewModel(station: stop, stationDetail: stationDetail)
    static var vm = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    static var previews: some View {
        StationDetailView(station: station)
            .environmentObject(vm)
    }
}
