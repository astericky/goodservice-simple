//
//  StationListTab.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/28/21.
//

import SwiftUI

struct StationListTab: View {
    @ObservedObject var viewModel: GoodServiceViewModel
//    var stationList
    var body: some View {
        GeometryReader { proxy in
            VStack {
                GoodServiceHeaderView()
                    .frame(width: proxy.size.width)
                ScrollView(.vertical) {
                    VStack {
                        Text("Station List Tab")
//                        ForEach(statusList, id: \.self) { status in
//                            RouteStatusView(viewModel: viewModel, status: status)
//                        }
                    }
                }
            }
        }
    }
}

struct StationListTab_Previews: PreviewProvider {
    static var viewModel = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    static var previews: some View {
        StationListTab(viewModel: viewModel)
    }
}
