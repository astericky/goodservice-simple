//
//  ServiceChangeSummariesView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/30/21.
//

import SwiftUI

struct ServiceChangeSummariesView: View {
    @ObservedObject var route: RouteViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Service Changes")
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .textCase(.uppercase)
                Spacer()
            }
            .padding(.vertical, 6)
            .background(Color.serviceChange)
            .padding(.bottom, 8)
            
            VStack(spacing: 16) {
                if let bothServiceChange = route.routeDetail?.serviceChangeSummaries["both"] {
                    ForEach(bothServiceChange, id: \.self) { serviceChangeSummary in
                        HStack {
                            Text(serviceChangeSummary)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                        }.padding(.bottom, 6)
                    }
                }
                
                if let northServiceChange = route.routeDetail?.serviceChangeSummaries["north"] {
                    ForEach(northServiceChange, id: \.self) { serviceChangeSummary in
                        HStack {
                            Text(serviceChangeSummary)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                        }.padding(.bottom, 6)
                    }
                }
                
                if let southServiceChagne = route.routeDetail?.serviceChangeSummaries["south"] {
                    ForEach(southServiceChagne, id: \.self) { serviceChangeSummary in
                        HStack {
                            Text(serviceChangeSummary)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                        }.padding(.bottom, 6)
                    }
                }
            }.padding(.horizontal)
            
        }.padding(.vertical, 16)
    }
}

struct ServiceChangeSummariesView_Previews: PreviewProvider {
    static var routeDetail = RouteDetailViewModel(route: routeADetail)
    static var route = RouteViewModel(route: routeA, routeDetail: routeDetail)
    static var previews: some View {
        ServiceChangeSummariesView(route: route)
    }
}
