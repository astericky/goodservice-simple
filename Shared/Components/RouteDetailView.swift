//
//  RouteDetailView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/18/21.
//

import SwiftUI

struct RouteDetailView: View {
    @ObservedObject var route: RouteViewModel
    
    var body: some View {
        VStack {
            title
            status
            if let serviceChangeSummaries = route.routeDetail?.serviceChangeSummaries,
               let bothServiceChangeSummaries = serviceChangeSummaries["both"],
               let northServiceChangeSummaries = serviceChangeSummaries["north"],
               let southServiceChangeSummaries = serviceChangeSummaries["south"]
            {
                if !bothServiceChangeSummaries.isEmpty || !northServiceChangeSummaries.isEmpty || !southServiceChangeSummaries.isEmpty {
                    ServiceChangeSummariesView(route: route)
                }
            }
            
            if let serviceIrregularitySummaries = route.routeDetail?.serviceIrregularitySummaries,
               let _ = serviceIrregularitySummaries["north"],
               let _ = serviceIrregularitySummaries["south"] {
                ServiceIrregularitySummariesView(route: route)
            }

            Spacer()
        }
        .onAppear(perform: self.getRouteDetail)
    }
}

extension RouteDetailView {
    var title: some View {
        HStack {
            Spacer()
            RouteIconView(route: route, size: 80)
            Spacer()
        }
        .padding()
    }
    var status: some View {
        VStack {
            Text(route.status)
                .font(.title)
                .foregroundColor(route.statusColor)
            Text("STATUS")
        }
    }
    
    func getRouteDetail() {
//#if DEBUG
//        route.fetchRouteDetailFromLocalData()
//#else
        route.fetchRouteDetailFromAPI()
//#endif
    }
}

struct RouteDetailView_Previews: PreviewProvider {
    static var routeViewModel = RouteViewModel(route: route1)
    static var previews: some View {
        RouteDetailView(route: routeViewModel)
    }
}
