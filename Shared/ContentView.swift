//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Sanders on 10/30/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject private var vm: GoodServiceViewModel
    
    var body: some View {
        TabView {
            RouteListTab()
                .tabItem {
                    Image("subway")
                    Text("Trains")
                }
            StationListTab()
                .tabItem {
                    Image("railway")
                    Text("Stations")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher()))
        }
    }
}
