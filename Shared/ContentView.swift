//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Sanders on 10/30/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
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
    
    init() {
        UITabBar.appearance().backgroundColor = .secondarySystemBackground
    }
}

extension ContentView {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
