//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Sanders on 10/30/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var viewModel = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    
    var body: some View {
        TabView {
            RouteListTab(viewModel: viewModel)
                .tabItem {
                    Image("subway")
                    Text("Trains")
                }
            StationListTab(viewModel: viewModel)
                .tabItem {
                    Image("railway")
                    Text("Stations")
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
