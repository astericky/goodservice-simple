//
//  RouteDetailView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/18/21.
//

import SwiftUI

struct RouteDetailView: View {
    var route: RouteViewModel

    var body: some View {
        VStack {
            title
            status
            if let _ = route.routeDetail?.serviceChangeSummaries {
                ServiceChangeSummariesView(route: route)
            }
            Spacer()
        }
        .foregroundColor(.white)
        .background(.black)
        .onAppear(perform: route.fetchRouteDetailFromLocalData)
    }
}

extension RouteDetailView {
    var title: some View {
        HStack {
            RouteIconView(route: route, size: 80)
            Spacer()
        }
        .padding(.horizontal)
    }
    var status: some View {
        VStack {
            Text(route.status)
                .font(.title)
                .foregroundColor(route.statusColor)
            Text("STATUS")
                .foregroundColor(.white)
        }
    }
}

struct ServiceChangeSummariesView: View {
    @ObservedObject var route: RouteViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Service Changes")
                Spacer()
            }
            .background(route.statusColor)
            
            if let bothServiceChange = route.routeDetail?.serviceChangeSummaries["both"] {
                ForEach(bothServiceChange, id: \.self) { serviceChangeSummary in
                    HStack {
                        Text(serviceChangeSummary)
                            .font(.caption)
                    }.padding(4)
                }
            }

            if let northServiceChange = route.routeDetail?.serviceChangeSummaries["north"] {
                ForEach(northServiceChange, id: \.self) { serviceChangeSummary in
                    HStack {
                        Text(serviceChangeSummary)
                            .font(.caption)
                    }.padding(4)
                }
            }

            if let southServiceChagne = route.routeDetail?.serviceChangeSummaries["south"] {
                ForEach(southServiceChagne, id: \.self) { serviceChangeSummary in
                    HStack {
                        Text(serviceChangeSummary)
                            .font(.caption)
                    }.padding(4)
                }
            }
        }.padding(.vertical, 16)
    }
}

struct RouteDetailView_Previews: PreviewProvider {
    static var routeViewModel = RouteViewModel(route: routeA)
    static var previews: some View {
        RouteDetailView(route: routeViewModel)
    }
}
