//
//  RouteListTab.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/10/21.
//

import SwiftUI

struct RouteListTab: View {
    @ObservedObject var viewModel: GoodServiceViewModel
    var statusList: [String] {
        Array<String>(viewModel.routesByStatus.keys)
    }

    var body: some View {
        GeometryReader { proxy in
            VStack {
                GoodServiceHeaderView()
                    .frame(width: proxy.size.width)
                ScrollView(.vertical) {
                    VStack {
                        ForEach(statusList, id: \.self) { status in
                            RouteStatusView(viewModel: viewModel, status: status)
                        }
                    }
                }
            }
            .background(.black)
        }
    }
}

struct RouteListTab_Previews: PreviewProvider {
    static var viewModel = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    static var previews: some View {
        RouteListTab(viewModel: viewModel)
    }
}
