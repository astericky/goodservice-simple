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
        return station.routes.map { name in
            vm.getRoute(by: name)!
        }
    }
    
    var body: some View {
        VStack {
            header
            upcomingTrainTimes
        }.navigationBarHidden(true)
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
            HStack {
                Text(station.name)
                    .font(.headline)
                ForEach(connectingRoutes) { route in
                    RouteIconView(route: route)
                }
                Spacer()

            }
            HStack {
                Text("World Trade Center")
                    .font(.caption)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }.padding()
            .padding(.top, 0)
    }
    
    private var upcomingTrainTimes: some View {
        GeometryReader { proxy in
            VStack {
                Text("Upcoming Train Times")
                    .bold()
                List {
                    Section(header: Text("To Court Sq, Jamica-179st")) {
                        HStack {
                            Text("Train ID / Destination")
                                .frame(width: proxy.size.width * 0.3)
                            Spacer()
                            Text("Projected Time")
                                .frame(width: proxy.size.width * 0.2)
                            Spacer()
                            Text("Current Location")
                                .frame(width: proxy.size.width * 0.2)
                            Spacer()
                            Text("Schedule Adherence")
                                .frame(width: proxy.size.width * 0.2)
                        }.font(.caption)
                        ForEach(0 ..< 10) { trip in
                            HStack {
                                Text("12345_1..2 to 96 St")
                                    .frame(width: proxy.size.width * 0.3)
                                Spacer()
                                Text("2 min")
                                    .frame(width: proxy.size.width * 0.2)
                                Spacer()
                                Text("1 min until 7 Av")
                                    .frame(width: proxy.size.width * 0.2)
                                Spacer()
                                Text("10 min")
                                    .frame(width: proxy.size.width * 0.2)
                            }.font(.callout)
                            
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        
    }
}

struct StationDetailView_Previews: PreviewProvider {
    static var stop = Stop(id: "E01", name: "World Trade Center", routes: [
        "E": ["north", "south"],
        "F": ["north", "south"]
    ])
    static var stopDetailResponse = StopDetailResponse(id: "L06", name: "1 Av", secondaryName: "World Trade Center", upcomingTrips: [
        "north": [
            Trip(id: "005300_E..N", routeId: "E", upcomingStopArrivalTime: 1640757180),
            Trip(id: "006850_E..N", routeId: "E", upcomingStopArrivalTime: 1640758110)
        ],
        "south": [
            Trip(id: "142350_E..S", routeId: "E", upcomingStopArrivalTime: 1640756706),
            Trip(id: "143800_E..S", routeId: "E", upcomingStopArrivalTime: 1640756706)
        ]
    ], timestamp: 1640756653)
    static var stationDetail = StationDetailViewModel(station: stopDetailResponse)
    static var station = StationViewModel(station: stop, stationDetail: stationDetail)
    static var vm = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    static var previews: some View {
        StationDetailView(station: station)
            .environmentObject(vm)
//        StationDetailView(station: station, viewModel: viewModel)
    }
}
