//
//  RouteDetailView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/18/21.
//

import SwiftUI

struct RouteDetailView: View {
    var routeViewModel: RouteViewModel

    var body: some View {
        VStack {
            title
            status
//            serviceChange
            Spacer()
        }
        .foregroundColor(.white)
        .background(.black)
    }
}

extension RouteDetailView {
    var title: some View {
        HStack {
            RouteIconView(route: routeViewModel, size: 80)
            Spacer()
        }
        .padding(.horizontal)
    }
    var status: some View {
        VStack {
            Text(routeViewModel.status)
                .font(.title)
                .foregroundColor(routeViewModel.statusColor)
            Text("STATUS")
                .foregroundColor(.white)
        }
    }
//    var serviceChange: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Text("Service Changes")
//                Spacer()
//            }
//            .background(route.statusColor)
//            ForEach(route.serviceChangeSummaries["both"]!, id: \.self) { serviceChangeSummary in
//                HStack {
//                    Text(serviceChangeSummary)
//                        .font(.caption)
//                }.padding(4)
//            }
//            ForEach(route.serviceChangeSummaries["north"]!, id: \.self) { serviceChangeSummary in
//                HStack {
//                    Text(serviceChangeSummary)
//                        .font(.caption)
//                }.padding(4)
//            }
//            ForEach(route.serviceChangeSummaries["south"]!, id: \.self) { serviceChangeSummary in
//                HStack {
//                    Text(serviceChangeSummary)
//                        .font(.caption)
//                }.padding(4)
//            }
//        }.padding(.vertical, 16)
//    }
}

struct RouteDetailView_Previews: PreviewProvider {
    static var routeViewModel = RouteViewModel(route: routeA)
    static var previews: some View {
        RouteDetailView(routeViewModel: routeViewModel)
    }
}
