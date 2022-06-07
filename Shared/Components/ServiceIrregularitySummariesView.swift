//
//  ServiceIrregularitySummaries.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/30/21.
//

import SwiftUI

struct ServiceIrregularitySummariesView: View {
    @ObservedObject var route: RouteViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Service Irregularities")
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .textCase(.uppercase)
                Spacer()
            }
            .padding(.vertical, 6)
            .background(Color.notGoodService)
            .padding(.bottom, 8)
            
            VStack(spacing: 16) {
                if let northServiceIrregularitySummary = route.routeDetail?.serviceIrregularitySummaries["north"] {
                    HStack {
                        Text(northServiceIrregularitySummary ?? "")
                            .font(.caption)
                    }
                }
                
                if let southServiceIrregularitySummary = route.routeDetail?.serviceIrregularitySummaries["south"] {
                    HStack {
                        Text(southServiceIrregularitySummary ?? "")
                            .font(.caption)
                    }
                }
            }.padding(.horizontal)
            
            
        }.padding(.bottom, 16)
    }
}

struct ServiceIrregularitySummariesView_Previews: PreviewProvider {
    static var routeDetail = RouteDetailViewModel(route: route1Detail)
    static var route = RouteViewModel(route: route1, routeDetail: routeDetail)
    static var previews: some View {
        ServiceIrregularitySummariesView(route: route)
    }
}
