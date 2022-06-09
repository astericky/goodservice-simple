//
//  HorizontalRoutesView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 6/8/22.
//

import SwiftUI

struct StationDetailHeaderView: View {
    var routes: [RouteViewModel]
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("clicked!")
//                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left.circle")
                        Text("Stations")
                    }
                }
                Spacer()
            }
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("42nd Street in the bX")
                        .font(.headline)
                    Text("Leferts Garden in Times Square")
                        .font(.caption)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                }
                HorizontalRouteListView(routes: routes, size: "small")
            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            HStack {
//                Text("Leferts Garden in Times Square")
//                    .font(.caption)
//                    .foregroundColor(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
//                Spacer()
//            }
        }.padding()
            .padding(.top, 0)
    }
}

struct StationDetailHeaderView_Previews: PreviewProvider {
    static var routes = [
        RouteViewModel(route: routeA),
        RouteViewModel(route: route1),
        RouteViewModel(route: routeN),
        RouteViewModel(route: routeS),
//        RouteViewModel(route: routeA),
//        RouteViewModel(route: route1),
//        RouteViewModel(route: routeN),
//        RouteViewModel(route: routeS),
//        RouteViewModel(route: routeA),
//        RouteViewModel(route: route1),
//        RouteViewModel(route: routeN),
//        RouteViewModel(route: routeS),
//        RouteViewModel(route: routeA),
//        RouteViewModel(route: route1),
//        RouteViewModel(route: routeN),
//        RouteViewModel(route: routeS),
    ]
    static var previews: some View {
        StationDetailHeaderView(routes: routes)
    }
}
